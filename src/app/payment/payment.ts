import {
  Controller,
  Post,
  Body,
  BadRequestException,
} from '@nestjs/common'
import Razorpay from 'razorpay'
import * as crypto from 'crypto'

@Controller('payment')
export class PaymentController {
  private razorpay: Razorpay

  constructor() {
    this.razorpay = new Razorpay({
      key_id: process.env.RAZORPAY_KEY_ID!,
      key_secret: process.env.RAZORPAY_KEY_SECRET!,
    })
  }

  // ✅ 1️⃣ Create Order
  @Post('create-order')
  async createOrder(@Body() body: { amount: number }) {
    if (!body.amount) {
      throw new BadRequestException('Amount is required')
    }

    const order = await this.razorpay.orders.create({
      amount: body.amount * 100, // rupees → paise
      currency: 'INR',
      receipt: 'rcpt_' + Date.now(),
    })

    return order
  }

  // ✅ 2️⃣ Verify Payment
  @Post('verify')
  verifyPayment(@Body() body: any) {
    const {
      razorpay_order_id,
      razorpay_payment_id,
      razorpay_signature,
    } = body

    const sign = razorpay_order_id + '|' + razorpay_payment_id

    const expectedSignature = crypto
      .createHmac('sha256', process.env.RAZORPAY_KEY_SECRET!)
      .update(sign)
      .digest('hex')

    if (expectedSignature !== razorpay_signature) {
      throw new BadRequestException('Payment verification failed')
    }

    return {
      success: true,
      message: 'Payment verified successfully',
    }
  }
}
