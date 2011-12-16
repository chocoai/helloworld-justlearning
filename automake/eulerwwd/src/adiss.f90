	SUBROUTINE ADISS(INID,T_STEP)
	USE DAMOD
	USE FD
	INTEGER::A,B,SIGN
	REAL::DISS(4),DS2(4),DS4(4),D2W(4,NCELLS),INID(4,NCELLS),T_STEP(NCELLS)
	D2W=0.
	DISS=0.
	INID=0.
	T_STEP=0.
	DO I=1,NEDGES
	IF(EDGE(5,I).EQ.0)THEN
	   J=EDGE(3,I)
	   K=EDGE(4,I)
	   D2W(:,J)=D2W(:,J)+W(:,K)-W(:,J)
	   D2W(:,K)=D2W(:,K)-W(:,K)+W(:,J)
	ENDIF
	ENDDO  
	DO I=1,NEDGES
	A=EDGE(1,I)
	B=EDGE(2,I)
	J=EDGE(3,I)
	K=EDGE(4,I)
	SIGN=EDGE(5,I)
	DX=NODE(1,B)-NODE(1,A)
	DY=NODE(2,B)-NODE(2,A)
	T_STEP(J)=T_STEP(J)+ABS(Z(I))+SONIC(I)*SQRT(DX**2+DY**2)
	IF(SIGN.EQ.0)THEN
	   T_STEP(K)=T_STEP(K)+ABS(Z(I))+SONIC(I)*SQRT(DX**2+DY**2)
	   SF=ABS(Z(I))+SONIC(I)*SQRT(DX**2+DY**2)
	   DEN=W(1,J)
	   U=W(2,J)/W(1,J)
	   V=W(3,J)/W(1,J)
	   E=W(4,J)/W(1,J)
	   PJ=(GAMA-1)*DEN*(E-0.5*(U**2+V**2))
	   DEN=W(1,K)
	   U=W(2,K)/W(1,K)
	   V=W(3,K)/W(1,K)
	   E=W(4,K)/W(1,K)
	   PK=(GAMA-1)*DEN*(E-0.5*(U**2+V**2))
	   SENSOR=ABS((PK-PJ)/(PK+PJ))
	   E2=K2*SENSOR
	   E4=0.
	   IF(K4-E2.GT.E4)E4=K4-E2
	   DISS(:)=SF*E2*(W(:,K)-W(:,J))
	   DISS(:)=DISS(:)-SF*E4*(D2W(:,K)-D2W(:,J))
	   INID(:,J)=INID(:,J)+DISS(:)
	   INID(:,K)=INID(:,K)-DISS(:)
	ENDIF
	ENDDO
	T_STEP=CFL/T_STEP
	END
