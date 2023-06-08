package cc.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.ClientMemberDTO;
import cc.spring.repositories.ClientMemberDAO;

@Service

public class ClientMemberService {
	@Autowired
	private ClientMemberDAO CDAO;
	
	public boolean login(ClientMemberDTO dto){
		System.out.println("123123");
		return CDAO.login(dto);
	}
	public String get_id_by_phone(String phone) {
		System.out.println("아이디값 받아오기 서비스!");
		return CDAO.get_id_by_phone(phone);
	}
	public boolean isClientMember(String id) {
		return CDAO.isClientMember(id);
	}
}
