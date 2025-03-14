function notice_delete(nidx){
	if(confirm("해당 내용을 삭제시 데이터는 복구 되지 않습니다.")){
		location.href='./notice_delete.do?nidx='+nidx;
	};
	
	
}