import { NextRequest } from "next/server";
import prisma from '@/app/utils/prismaClient'

export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams
  const id = searchParams.get('id')
  
  const campagne = await prisma.campagne.findUnique({
    where: {
      id: Number(id)
    },
    include: {
      personnages: true
    }
  })

  return {
    status: 200,
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(campagne),
  }

}