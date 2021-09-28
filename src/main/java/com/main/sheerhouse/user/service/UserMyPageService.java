package com.main.sheerhouse.user.service;

import java.util.List;

import com.main.sheerhouse.user.domain.HomeVO;

public interface UserMyPageService {

	List<HomeVO> getHomeList(HomeVO home);

}
