package com.petstle.mapper;

import java.util.List;

import com.petstle.domain.Pet;

public interface PetMapper {
	public List<Pet> listPetOnUser(String usrid);
	public Pet detailPet(String petid);
	public void newPet(Pet pet);
	public void updatePet(Pet pet);
	public void attachPictureOnPet(Pet pet);
	public void deletePet(String petid);
}
