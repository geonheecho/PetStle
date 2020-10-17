package com.petstle.mapper;

import java.util.List;

import com.petstle.domain.PetAttribute;

public interface PetAttributeMapper {
	public List<PetAttribute> petGender();
	public List<PetAttribute> petNeutralization();
	public List<PetAttribute> petBreed();
	public List<PetAttribute> petBowel();
	public List<PetAttribute> petHandicap();
	public List<PetAttribute> petSeparation();
	public List<PetAttribute> petAggrtomen();
	public List<PetAttribute> petAggrtopet();
}
