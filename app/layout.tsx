import type { Metadata } from 'next'
import './globals.css'

export const metadata: Metadata = {
  title: 'Hello from Yuvraj',
  description: 'A simple hello page',
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
