import React from 'react'
import PersonnageEditor from '@/components/PersonnageEditor'
import prisma from '@/app/utils/prismaClient'

const NewPersonnage = async () => {
  const available_livrets = await fetch_livrets()

  async function fetch_livrets() {
    return await prisma.livret.findMany()
  }

  return (
    <div>
      <PersonnageEditor livrets={available_livrets} />
    </div>
  )
}

export default NewPersonnage