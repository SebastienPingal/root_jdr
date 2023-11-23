import { Button } from '@/components/ui/button'
import { Personnage } from '@prisma/client'

const Home = async () => {
  const campagne = await fetch(`${process.env.NEXT_URL}/api/campagne?id=1`).then((res) => res.json())

  return (
    <div>
      <Button> HOO </Button>
      {
        campagne?.personnages?.length && (
          campagne.personnages.map((personnage: Personnage) => {
            return (
              <Button key={personnage.id} >
                {personnage.name}
              </Button>
            )
          })
        )
      }
    </div>
  )
}

export default Home