import { Button } from '@/components/ui/button'
import { Personnage } from '@prisma/client'
import prisma from '@/app/utils/prismaClient'
import Link from 'next/link'
import { Plus } from 'lucide-react'

const Home = async () => {
  const campagne = await fetch_campagne()

  async function fetch_campagne() {
    "use server"
    const that_campagne = await prisma.campagne.findFirst({
      where: {
        id: 1
      },
      include: {
        personnages: true
      }
    })
    return that_campagne
  }

  return (
    <div className='flex flex-col gap-2'>
      {
        campagne?.personnages?.length ? (
            campagne.personnages.map((personnage: Personnage) => (
              <Button key={personnage.id} >
                {personnage.name}
              </Button>
            ))
          )
        : <div>Pas de personnage</div>
      }

      <Link href="/personnage/new">
        <Button className='w-fit'> <Plus /> Créer un personnage </Button>
      </Link>
    </div>
  )
}

export default Home