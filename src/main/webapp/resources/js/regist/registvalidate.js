		function nameCheck(petName){
			var checkName = petName;
			var alertName = document.getElementById("alertName");
			var reName = /^[ㄱ-ㅎ가-힣a-zA-Z]{1,}$/;

			if(!reName.test(checkName)){
				alertName.innerHTML = "<font color='Red'>부적절한 값입니다.</font>";
				flag=false;
			}else{
				alertName.innerHTML ="<br>";
				flag=true;
			}
			if(flag){
				if(checkName != null && typeof checkName != "undefined"){
					if(checkName.length>6){
						alertName.innerHTML = "<font color='Red'>글자 수가 너무 많습니다.</font>";
					}else{
						alertName.innerHTML = "<br>";
					}
				}else	return false;
			}
		}
		
		function ageCheck(petAge){
			var checkAge = petAge;
			var alertAge = document.getElementById("alertAge");
			var numAge = /^[0-9]{0,2}$/;
			
			if(!numAge.test(checkAge)){
				alertAge.innerHTML = "<font color='Red'>부적절한 값입니다.</font>";
			}else{
				alertAge.innerHTML = "<br>";
			}
		}
		
		function weightCheck(petWeight){
			var checkWeight = petWeight;
			var alertWeight = document.getElementById("alertWeight");
			var numWeight = /^[0-9]{0,2}$/;
			
			if(!numWeight.test(checkWeight)){
				alertWeight.innerHTML = "<font color='Red'>부적절한 값입니다.</font>";
			}else{
				alertWeight.innerHTML = "<br>";
			}
		}
		
		function regist(){
			var selectVal = document.getElementById("brd_sel");
			if(selectVal.selectedIndex == 0){
				alertBox.innerHTML = "<font color='Red'>견종을 선택해주세요.</font>";
				return false;
			}
			var flag = false;
			var imageFlag = false;
			var genVal = document.getElementsByName("gen");
			for(i=0;i<genVal.length;i++){
				if(genVal[i].checked){
					flag=true;
					break;
				}else flag = false;		
			}
			
			if(!flag) {
				alertGen.innerHTML = "<font color='Red'>성별을 선택해주세요.</font>";
			}
			
			var bowVal = document.getElementsByName("bow");
			for(i=0;i<bowVal.length;i++){
				if(bowVal[i].checked){
					flag=true;
					break;
				}else flag = false;		
			}
			if(!flag) {
				alertBow.innerHTML = "<font color='Red'>훈련여부를 선택해주세요.</font>";
			}
			
			var neuVal = document.getElementsByName("neu");
			for(i=0;i<neuVal.length;i++){
				if(neuVal[i].checked){
					flag=true;
					break;
				}else flag = false;
			}
			if(!flag) {
				alertNeu.innerHTML = "<font color='Red'>중성화 여부를 선택해주세요.</font>";
			}
			
			var hanVal = document.getElementsByName("han");
			for(i=0;i<hanVal.length;i++){
				if(hanVal[i].checked){
					flag=true;
					break;
				}else flag = false;
			}
			if(!flag) {
				alertHan.innerHTML = "<font color='Red'>장애 여부를 선택해주세요.</font>";
			}
			
			var sepVal = document.getElementsByName("sep");
			for(i=0;i<sepVal.length;i++){
				if(sepVal[i].checked){
					flag=true;
					break;
				}else flag = false;	
			}
			if(!flag) {
				alertSep.innerHTML = "<font color='Red'>분리불안 증세가 있나요?</font>";	
			}
			
			var atmVal = document.getElementsByName("atm");
			for(i=0;i<atmVal.length;i++){
				if(atmVal[i].checked){
					flag=true;
					break;
				}else flag = false;	
			}
			if(!flag) {
				alertAtm.innerHTML = "<font color='Red'>성격을 선택해주세요.</font>";
			}
			
			var atpVal = document.getElementsByName("atp");
			for(i=0;i<atpVal.length;i++){
				if(atpVal[i].checked){
					flag=true;
					break;
				}else flag = false;
			}
			if(!flag) {
				alertAtp.innerHTML = "<font color='Red'>성격을 선택해주세요.</font>";
			}
			
			if(flag){
				var fillError = false;
				if(isEmpty(document.getElementById("name").value)) fillError = true;
				if(isEmpty(document.getElementById("age").value)) fillError = true;
				if(isEmpty(document.getElementById("weight").value)) fillError = true;
				if(isEmpty(document.getElementById("brd_sel").value)) fillError = true;
				if(isUnselected(document.getElementsByName("gen"))) fillError = true;
				if(isUnselected(document.getElementsByName("neu"))) fillError = true;
				if(isUnselected(document.getElementsByName("bow"))) fillError = true;
				if(isUnselected(document.getElementsByName("han"))) fillError = true;
				if(isUnselected(document.getElementsByName("sep"))) fillError = true;
				if(isUnselected(document.getElementsByName("atm"))) fillError = true;
				if(isUnselected(document.getElementsByName("atp"))) fillError = true;
				
				if(fillError){
					var nameValue = document.getElementById("name").value;
					var ageValue = document.getElementById("age").value;
					var weightValue = document.getElementById("weight").value;
					var alertName = document.getElementById("alertName");
					
					if(typeof nameValue == "undefined"|| nameValue == null || nameValue ==""){
						alertName.innerHTML = "<font color='Red'>이름을 적어주세요.</font>";
						return false;
					}
					if(typeof ageValue == "undefined" || ageValue == null || ageValue ==""){
						alertAge.innerHTML = "<font color='Red'>나이를 적어주세요.</font>";
						return false;
					}
					if(typeof weightValue == "undefined" ||weightValue == null || weightValue ==""){
						alertWeight.innerHTML = "<font color='Red'>체중을 적어주세요.</font>";
						return false;
					}
				}else{
					var result = checkImage(imageFlag);
					if(result){
						valueCheck();
					}else return false;
				}
			}
		}
		
		function valueCheck(){
			var checkName = document.getElementById("name").value;
			var reName = /^[ㄱ-ㅎ가-힣a-zA-Z]{0,}$/;
			var checkAge = document.getElementById("age").value;
			var numAge = /^[0-9]{0,2}$/;
			var checkWeight = document.getElementById("weight").value;
			var numWeight = /^[0-9]{0,2}$/;
			var cFlag = false;
			var eFlag = false;
			var aFlag = false;
			var wFlag = false;
			
			
			if(!reName.test(checkName)){
				return false;
			}else{
				cFlag = true;
			}
			
			if(checkName.length>6){
				return false;
			}else{
				eFlag = true;
			}
			if(!numAge.test(checkAge)){
				return false;
			}else{
				aFlag = true;
			}
			
			if(!numWeight.test(checkWeight)){
				return false;
			}else{
				wFlag = true;
			}
			
			if(cFlag&&eFlag&&aFlag&&wFlag){
				pet_form.submit();
			}else return false;
		}
		
		function delAlert(attrName){
			var attrtemp = attrName;
			switch(attrtemp){
			case 'brd_sel': alertBox.innerHTML = "<br>"; break;
			case 'gen' : alertGen.innerHTML = "<br>"; break;
			case 'bow' : alertBow.innerHTML = "<br>"; break;
			case 'neu' : alertNeu.innerHTML = "<br>"; break;
			case 'han' : alertHan.innerHTML = "<br>"; break;
			case 'sep' : alertSep.innerHTML = "<br>"; break;
			case 'atm' : alertAtm.innerHTML = "<br>"; break;
			case 'atp' : alertAtp.innerHTML = "<br>"; break;
			case 'imageAlert' : imageAlert.innerHTML = ""; break;
			}
		}
		
		function deleteAlt(){
			var delalt = document.getElementById("imageAlert");
			delalt.innerHTML = "";
		}
		function isEmpty(str){
			if(typeof str == "undefined" || str == null || str == "")
	            return true;
	        else
	            return false ;
	    }
		
		function isUnselected(e){
			for(var i=0;i<e.length;i++)
				if(e[i].checked)
					return false;
			return true;
		}
		
		function checkImage(imageFlag){
			var ckimg = document.getElementsByClassName("upload-display");
			var imgAlert = document.getElementById("imageAlert");
			var temp = imageFlag;
			
			if(ckimg.length>0){
				imgAlert.innerHTML = "<br>";
				temp = true;
				return temp; 
			}else{
				imgAlert.innerHTML = "<font color='Red'>이미지를 첨부해주세요.</font>";
				temp = false;
				return temp;
			}
		}