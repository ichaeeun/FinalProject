# FinalProject
프로젝트 관리 시스템 구현 프로젝트입니다.

메뉴구조 

CEO ------ (메인) DASHBOARD (전체 프로젝트 현황) 
        |-- 프로젝트 --- 진행중 전체 프로젝트 --- 프로젝트 오버뷰
        |            |- 완료된 프로젝트      |- 태스크 리스트 -- 태스크 디테일 
        |                                |- 대시보드 
        |                                |- 간트차트 
        |                                |- 캘린더
        |                                |- 활동로그
        |                                |- 리스크 현황 
        |-- 인력현황 
        |-- 리스크 현황 
        
        
인사담당자 --- (메인) 인력현황 --- 전체인원 -- 계정 생성, 프로젝트 할당 기능 
         |                 |- 가용인원
         |                 |- 부서별 인원 
         |--대시보드
         |--프로젝트 --- 진행중 전체 프로젝트 --- 프로젝트 오버뷰
         |            |- 완료된 프로젝트      |- 태스크 리스트 -- 태스크 디테일 
         |                                |- 대시보드 
         |                                |- 간트차트 
         |                                |- 캘린더
         |                                |- 활동로그
         |                                |- 리스크 현황 
         |-- 리스크 현황 


PM ------ (메인) DASHBOARD (현재 맡은 프로젝트 현황) 
        |-- 프로젝트 --- 진행중 담당 프로젝트 --- 프로젝트 오버뷰
        |            |- 완료된 담당 프로젝트  |- 태스크 리스트 -- 태스크 디테일 -- 태스크 할당 및 수정 권한 
        |                                |- 대시보드 
        |                                |- 간트차트 
        |                                |- 캘린더
        |                                |- 활동로그
        |                                |- 리스크 현황 
        |-- 인력현황 
        |-- 요청관리 -- 태스크 승인 요청(승인 요청 현황을 확인하고 승인하는 기능)
                    |- 리스크 승인 요청(개발자가 등록한 리스크 요청을 확인하고 승인하는 기능) 


개발자 ------ (메인) My Task (현재 담당 중인 업무 목록) 
        |-- 프로젝트 --- 진행중 담당 프로젝트 --- 프로젝트 오버뷰
        |            |- 완료된 담당 프로젝트  |- 태스크 리스트 -- 태스크 디테일 
        |                                |- 대시보드 
        |                                |- 간트차트 
        |                                |- 캘린더
        |                                |- 활동로그
        |                                |- 리스크 현황 
        |
        |-- 요청관리 -- 태스크 승인 요청(요청한 태스크 목록)
                    |- 리스크 승인 요청(요청한 리스크 목록) 
                    
