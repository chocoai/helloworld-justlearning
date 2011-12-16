SUBROUTINE super_boundary(WT,I)
USE DAMOD
REAL::NX,NY,WT(4)
INTEGER::A,B
    A=EDGE(1,I)
	B=EDGE(2,I)
	J=EDGE(3,I)
	DX=NODE(1,B)-NODE(1,A)
	DY=NODE(2,B)-NODE(2,A)
	S=SQRT(DX**2+DY**2)
	NX=DY/S
	NY=-DX/S
	VN8=U8*NX+V8*NY
    IF(VN8.GT.1.E-5)THEN
      WT(:)=W(:,J)
	ELSE
      WT(1)=W18
	  WT(2)=W28
	  WT(3)=W38
	  WT(4)=W48
	ENDIF
	  END
