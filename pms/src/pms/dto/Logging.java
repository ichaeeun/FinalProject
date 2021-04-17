package pms.dto;


import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// aop 처리할 메서드 선언.
public class Logging{

	// 로그 처리 기능 클래스 선언
	private static final Logger logger = LoggerFactory.getLogger(Logging.class);
	
	// 이후 시점.
	public void logAfter(JoinPoint joinPoint) {
		logger.info("태스크 할당");
	}
	

}

