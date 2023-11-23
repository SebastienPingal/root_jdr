import React from 'react'
import prisma from '@/app/utils/prismaClient'
import PersonnageEditor from '@/components/PersonnageEditor'

interface PagePersonnageProps {
  params: {
    id: string
  }
}

const PagePersonnage = async ({ params }: PagePersonnageProps) => {
  const id = params.id
  const perso = await fetchPersonnage()
  const [personnage, setPersonnage] = React.useState(null)

  async function fetchPersonnage() {
    'use server'
    const personnage = await prisma.personnage.findUnique({
      where: {
        id: Number(id)
      }
    })
    return personnage
  }

  return (
    <div>
      {perso && <PersonnageEditor personnage={perso} />}
    </div>
  )
}

export default PagePersonnage