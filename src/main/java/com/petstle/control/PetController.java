package com.petstle.control;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.petstle.Constants;
import com.petstle.domain.Pet;
import com.petstle.domain.PetAttribute;
import com.petstle.service.UserServiceImpl;
import com.petstle.service.PetService;
import com.petstle.verification.VerifyUserService;

@Controller
@RequestMapping("pet")
public class PetController implements Constants{
	@Autowired
	private PetService pservice;
	@Autowired
	private VerifyUserService vservice;
	
	@Autowired
	private UserServiceImpl login;
	
	@RequestMapping("")
	public String rtnToHome() {
		return "redirect:/";
	}
	
	@GetMapping("list")
	public ModelAndView listPet() {
		if(!login.isLogged())
			return new ModelAndView("redirect:/");
		ModelAndView mav = new ModelAndView("pet/pet_list");
		String usrid = login.getLoggedUsrid();
		List<Pet> plist = pservice.listPet(usrid);
		mav.addObject("plist", plist);
		return mav;
	}
	@GetMapping("pet")
	public ModelAndView detailPet(String id) {
		if(!login.isLogged())
			return new ModelAndView("redirect:/");
		if(!vservice.verify(id, PET))
			return new ModelAndView("redirect:list");
		ModelAndView mav = new ModelAndView("pet/pet_detail");
		Pet pet = pservice.detailPet(id);
		mav.addObject("pet", pet);
		return mav;
	}
	@GetMapping("add")
	public ModelAndView addPetForm() {
		if(!login.isLogged())
			return new ModelAndView("redirect:/");
		ModelAndView mav = new ModelAndView("pet/pet_add");
		Map<String, List<PetAttribute>> attrs = pservice.getPetAttribute();
		mav.addObject("attrs", attrs);
		return mav;
	}
	@PostMapping("add")
	public String addPet(Pet pet) {
		if(!login.isLogged())
			return "redirect:/";
		String usrid = login.getLoggedUsrid();
		pet.setF_usr(usrid);
		pservice.addPet(pet);
		return "redirect:list";
	}
	@GetMapping("edit")
	public ModelAndView editPetForm(String petid) {
		if(!login.isLogged())
			return new ModelAndView("redirect:/");
		if(vservice.verify(petid, PET)){
			ModelAndView mav = new ModelAndView("pet/pet_edit");
			Map<String, List<PetAttribute>> attrs = pservice.getPetAttribute();
			Pet pet = pservice.detailPet(petid);
			mav.addObject("attrs", attrs);
			mav.addObject("pet", pet);
			return mav;
		}
		else {
			return new ModelAndView("redirect:/");
		}
	}
	@PostMapping("edit")
	public String editPet(Pet pet) {
		if(!login.isLogged())
			return "redirect:/";
		if(vservice.verify(pet.getPetid(), PET))
			pservice.updatePet(pet);
		return "redirect:list";
	}
	@GetMapping("del")
	public String deletePet(String petid) {
		if(!login.isLogged())
			return "redirect:/";
		if(vservice.verify(petid, PET))
			pservice.detailPet(petid);
		return null;
	}
}