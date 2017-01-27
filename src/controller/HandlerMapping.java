package controller;

public class HandlerMapping {
	private static HandlerMapping instance = new HandlerMapping();

	private HandlerMapping() {
	}

	public static HandlerMapping getInstance() {
		return instance;
	}

	public Controller create(String command) {
		Controller c = null;
		
		//******Notice**********
		if(command.equals("list")){
			c = new ListController();                       //list controller
		}else if(command.equals("showContentNotHit")){
			c = new ShowContentController();         //show content controller
		}else if(command.equals("write")){
			c = new BoardWriteController();          //write controller 
		}else if(command.equals("update")){
			c = new BoardUpdateController();        //Update controller
		}else if(command.equals("updateView")){
			c = new UpdateViewController();
			
		//*******Member**********
		}else if(command.equals("login")){                   //login
			c = new LoginController();
		}else if(command.equals("logout")){                   //logout
			c = new LogoutController();
		}else if(command.equals("idcheck")){
			c = new IDCheckController();
		}else if(command.equals("register")){                   //register
			System.out.println(command);
			c = new RegisterController();
		}else if(command.equals("memberUpdate")){                 //update
	         c = new MemberUpdateController();
	      }else if(command.equals("memberUpdateView")){                 //updateview
	         c = new MemberUpdateViewController();
	      }else if(command.equals("showDetail")){                 //showDetail
	         c = new ShowDetailController();
	      }else if(command.equals("")){                   //delete account
			c = new DropMemberController();
			
		//**********Poke***********
	  	}else if(command.equals("pokeInsert")){                   //send poke
			c = new PokeInsertController();
		}else if(command.equals("pokeUpdate")){				//accept/decline poke	   
			c = new PokeUpdateController();
		}else if(command.equals("pokeRe")){			//received poke list
			c = new PokeReceiveController();
		}else if(command.equals("pokeSe")){			//sent poke list
			c = new PokeSendListController();
		}else if(command.equals("pokedetail")){		// poke sender detail
			c = new PokeSeIdDetailController();
		}else if(command.equals("pokedetail2")){		// poke receiver detail
			c = new PokeReIdDetailController();
		}else if(command.equals("pokeOk")){		// 
			c = new PokeOkController();
		}else if(command.equals("pokeNo")){		// find poke
			c = new PokeNoController();
		}else if(command.equals("search")){
			c = new SearchController(); 
		}
		return c;
	}
}
