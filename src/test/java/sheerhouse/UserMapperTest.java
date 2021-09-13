package sheerhouse;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.main.sheerhouse.user.domain.UserVO;
import com.main.sheerhouse.user.mapper.UserLoginMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTest {

	@Autowired
	UserLoginMapper mapper; 
	
	//@Test
	public void emailCheckTest() {
		String check = mapper.emailCheck("dijung90@daum.net");
		
		System.out.println(check);
	}
	
	@Test
	public void insertUser() {
		UserVO user = new UserVO();
		user.setEmail("dijung9090@daum.net");
		user.setPhone("010-7602-6663");
		user.setPassword("password");
		user.setName("정다이");
		user.setBirthyear("1991");
		
		
		 mapper.insertUser(user);
		
		
	}
}
