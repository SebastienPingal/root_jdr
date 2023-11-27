"use client"
import React, { useState } from 'react'
import { Prisma, Livret, Personnage as PersonnageType} from '@prisma/client'

import { Input } from "@/components/ui/input"
import { Textarea } from "@/components/ui/textarea"
import { Label } from "@/components/ui/label"

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"

const PersonnageEditor = ({
  personnage: initialPersonnage = {
    name: '',
    details: '',
    espece: '',
    campagne: {
      connect: {
        id: 1
      }
    },
  },
  livrets
}: { personnage?: Prisma.PersonnageCreateInput | PersonnageType, livrets: Livret[] }) => {
  const [personnage, setPersonnage] = useState(initialPersonnage);
  const [selectedLivret, setSelectedLivret] = useState(null);
  if (personnage.livretId) {
    setSelectedLivret(livrets.find(livret => livret.id === personnage.livretId)
  }


  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
    const { name, value } = e.target;
    setPersonnage(prevPersonnage => ({
      ...prevPersonnage,
      [name]: value
    }));
  }

  function changeLivret(value: string) {
    setPersonnage(prevPersonnage => ({
      ...prevPersonnage,
      livret: { connect: { id: Number(value) } }
    }));
  }
  return (
    <form className='flex flex-col gap-4 w-fit'>
      <div>
        <Label htmlFor="name">Nom</Label>
        <Input name="name" value={personnage.name! || ''} onChange={handleChange} placeholder='Entrez votre nom ici' />
      </div>
      <div>
        <Label htmlFor="espece">Espèce</Label>
        <Input name="espece" value={personnage.espece! || ''} onChange={handleChange} placeholder='Entrez votre espèce ici' />
      </div>
      <div>
        <Label htmlFor="details">Détails</Label>
        <Textarea name="details" value={personnage.details! || ''} onChange={handleChange} placeholder='Des détails a propos de votre personnages' />
      </div>
      <div>
        <Label htmlFor="livret">Livret</Label>
        <Select name="livret" defaultValue={personnage.livret?.name || null} onValueChange={changeLivret}>
          <SelectTrigger>
            <SelectValue placeholder="Choisissez un livret" />
          </SelectTrigger>
          <SelectContent>
            {
              livrets.map((livret) => (
                <SelectItem key={livret.id} value={livret.name}>{livret.name}</SelectItem>
              ))
            }
          </SelectContent>
        </Select>
      </div>
      <select name="livret" id="livret">
        {
          livrets.map((livret) => (
            <option key={livret.id} value={livret.id}>{livret.name}</option>
          ))
        }
      </select>
    </form>
  )
}

export default PersonnageEditor