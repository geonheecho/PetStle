package com.petstle.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petstle.domain.Pet;
import com.petstle.domain.PetAttribute;
import com.petstle.mapper.PetAttributeMapper;
import com.petstle.mapper.PetMapper;

@Service
public class PetServiceImpl implements PetService {
	@Autowired
	private PetMapper pmapper;
	@Autowired
	private PetAttributeMapper pamapper;
	
	@Override
	public List<Pet> listPet(String usrid) {
		return pmapper.listPetOnUser(usrid);
	}

	@Override
	public Pet detailPet(String petid) {
		return pmapper.detailPet(petid);
	}

	@Override
	@Transactional
	public String addPet(Pet pet) {
		pmapper.newPet(pet);
		
		/*
		 * picture attach code here
		 */
		
		pmapper.updatePet(pet);
		return pet.getPetid();
	}

	@Override
	public Map<String, List<PetAttribute>> getPetAttribute() {
		Map<String, List<PetAttribute>> attrmap = new HashMap<String, List<PetAttribute>>();
		attrmap.put("gen", pamapper.petGender());
		attrmap.put("neu", pamapper.petNeutralization());
		attrmap.put("brd", pamapper.petBreed());
		attrmap.put("bow", pamapper.petBowel());
		attrmap.put("han", pamapper.petHandicap());
		attrmap.put("sep", pamapper.petSeparation());
		attrmap.put("atm", pamapper.petAggrtomen());
		attrmap.put("atp", pamapper.petAggrtopet());
		
		return attrmap;
	}

	@Override
	public boolean updatePet(Pet pet) {
		pmapper.updatePet(pet);
		return false;
	}

	@Override
	public boolean deletePet(String petid) {
		return false;
	}
}
