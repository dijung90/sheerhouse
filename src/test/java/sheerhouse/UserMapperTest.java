package sheerhouse;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.mapper.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTest {

	@Autowired
	UserMapper mapper; 
	
	//@Test
	public void emailCheckTest() {
		String check = mapper.emailCheck("dijung90@daum.net");
		
		System.out.println(check);
	}
	
	@Test
	public void insertUser() {
		UserVO user = new UserVO();
		user.setEmail("dijung90@daum.net");
		user.setPhone("010-7602-6663");
		user.setPassword("password");
		user.setName("¡§¥Ÿ¿Ã");
			
		
		int result = mapper.insertUser(user);
		
		System.out.println(result);
		
	}
}
