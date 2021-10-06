package com.main.sheerhouse.admin.service;

import com.main.sheerhouse.admin.domain.TermVO;

public interface TermService {
	public TermVO selectguestterm(TermVO guestterm);
	public TermVO selecthostterm(TermVO hostterm);
	public TermVO selectbasicterm(TermVO basicterm);
}
