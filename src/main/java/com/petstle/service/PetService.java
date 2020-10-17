package com.petstle.service;

import java.util.List;
import java.util.Map;

import com.petstle.domain.Pet;
import com.petstle.domain.PetAttribute;

public interface PetService {
	public List<Pet> listPet(String usrid);
	public Pet detailPet(String petid);
	public String addPet(Pet pet);
	public Map<String, List<PetAttribute>> getPetAttribute();
	public boolean updatePet(Pet pet);
	public boolean deletePet(String petid);
}
