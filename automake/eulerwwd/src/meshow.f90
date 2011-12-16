subroutine meshow
USE DAMOD
	OPEN(5,FILE='meshow.PLT',FORM='FORMATTED')
	WRITE(5,*)'TITLE = "meshow"'
	WRITE(5,*)'VARIABLES= "X","Y"'
	WRITE(5,*)'ZONE N=',nde,',E=',nel,',F=FEPOINT,ET=TRIANGLE'
	WRITE(5,21)((mend(J,I),J=1,2),I=1,nde)
	WRITE(5,32)((cell(J,I),J=1,3),I=1,nel)
	CLOSE(5)
	PRINT*,'meshow exported '
21    FORMAT(2E15.7)
32    FORMAT(3I7)
end