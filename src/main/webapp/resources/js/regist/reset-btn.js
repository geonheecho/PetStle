function reset_btn(){
					document.getElementById('brd_sel').selectedIndex = 0;
					$('select').niceSelect('update');
    				$('input').val('');
    				var e = document.getElementsByName("gen");
	    				for(var i=0;i<e.length;i++) e[i].checked = false;
	    				e = document.getElementsByName("neu");
	    				for(var i=0;i<e.length;i++) e[i].checked = false;
	    				e = document.getElementsByName("bow");
	    				for(var i=0;i<e.length;i++) e[i].checked = false;
	    				e = document.getElementsByName("han");
	    				for(var i=0;i<e.length;i++) e[i].checked = false;
	    				e = document.getElementsByName("sep");
	    				for(var i=0;i<e.length;i++) e[i].checked = false;
	    				e = document.getElementsByName("atm");
	    				for(var i=0;i<e.length;i++) e[i].checked = false;
	    				e = document.getElementsByName("atp");
	    				for(var i=0;i<e.length;i++) e[i].checked = false;
	    			var uploadimg = document.getElementsByClassName('upload-display');
	    			if(uploadimg !=null){
	    				uploadimg[0].parentNode.removeChild(uploadimg[0]);
	    			}
    		};