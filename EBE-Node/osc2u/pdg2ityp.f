cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine pdg2id (ityp,iso3,pdgid)
c
c     Author   : Steffen A. Bass
c     Date     : 06/08/98
c     Revision : 1.0
c
c based on ityp2pdg.f from Henning Weber
c 
c     converts PDG-Id to  UrQMD-Id 
c
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      implicit none


      integer pdgid,i
      integer ityp
      integer iso3

      integer tab_size
      parameter (TAB_SIZE = 165)

      integer idtab(3,TAB_SIZE)

      data idtab/
c Neutron
     .       1, -1,  2112,  
c Proton
     .       1,  1,  2212,
c N*
     .       2, -1, 12112, 
     .       2,  1, 12212,
     .       3, -1,  1214, 
     .       3,  1,  2124, 
     .       4, -1, 22112, 
     .       4,  1, 22212,
     .       5, -1, 32112,
     .       5,  1, 32212,
     .       6, -1,  2116,
     .       6,  1,  2216,
     .       7, -1, 12116,
     .       7,  1, 12216,
     .       8, -1, 21214,
     .       8,  1, 22124,
     .       9, -1, 42112, 
     .       9,  1, 42212, 
     .      10, -1, 31214, 
     .      10,  1, 32124, 
     .      14, -1,  1218, 
     .      14,  1,  2128, 
c Delta
     .      17, -3,  1114,
     .      17, -1,  2114,
     .      17,  1,  2214,
     .      17,  3,  2224,
     .      18, -3, 31114,
     .      18, -1, 32114,
     .      18,  1, 32214,
     .      18,  3, 32224,
     .      19, -3,  1112,
     .      19, -1,  1212,
     .      19,  1,  2122,
     .      19,  3,  2222,
     .      20, -3, 11114,
     .      20, -1, 12114,
     .      20,  1, 12214,
     .      20,  3, 12224,
     .      21, -3, 11112,
     .      21, -1, 11212,
     .      21,  1, 12122,
     .      21,  3, 12222,
     .      22, -3,  1116,
     .      22, -1,  1216,
     .      22,  1,  2126,
     .      22,  3,  2226,
     .      23, -3, 21112,
     .      23, -1, 21212,
     .      23,  1, 22122,
     .      23,  3, 22222,
     .      24, -3, 21114,
     .      24, -1, 22114,
     .      24,  1, 22214,
     .      24,  3, 22224,
     .      25, -3, 11116,
     .      25, -1, 11216,
     .      25,  1, 12126,
     .      25,  3, 12226,
     .      26, -3,  1118,
     .      26, -1,  2118,
     .      26,  1,  2218,
     .      26,  3,  2228,
c Lambda
     .      27,  0,  3122,
     .      28,  0, 13122,   
     .      29,  0,  3124,   
     .      30,  0, 23122,   
     .      31,  0, 33122,
     .      32,  0, 13124,
     .      33,  0, 43122,   
     .      34,  0, 53122,   
     .      35,  0,  3126,   
     .      36,  0, 13126,   
     .      37,  0, 23124,   
     .      38,  0,  3128,   
     .      39,  0, 23126,   
c Sigma
     .      40, -2,  3112,
     .      40,  0,  3212,
     .      40,  2,  3222,
     .      41, -2,  3114,
     .      41,  0,  3214,
     .      41,  2,  3224,
     .      42, -2, 13112,
     .      42,  0, 13212,
     .      42,  2, 13222,
     .      43, -2, 13114,
     .      43,  0, 13214,
     .      43,  2, 13224,
     .      44, -2, 23112,
     .      44,  0, 23212,
     .      44,  2, 23222,
     .      45, -2,  3116,
     .      45,  0,  3216,
     .      45,  2,  3226,
     .      46, -2, 13116,
     .      46,  0, 13216,
     .      46,  2, 13226,
     .      47, -2, 23114,
     .      47,  0, 23214,
     .      47,  2, 23224,
     .      48, -2,  3118,
     .      48,  0,  3218,
     .      48,  2,  3228,
c Xi
     .      49, -1,  3312,
     .      49,  1,  3322,
     .      50, -1,  3314,
     .      50,  1,  3324,
     .      52, -1, 13314,
     .      52,  1, 13324,
c Omega
     .      55,  0,  3334,
c gamma
     .     100,  0,    22, 
c pion
     .     101, -2,  -211,
     .     101,  0,   111,
     .     101,  2,   211,
c eta
     .     102,  0,   221,
c omega
     .     103,  0,   223,
c rho
     .     104, -2,  -213,
     .     104,  0,   113, 
     .     104,  2,   213,
c f0(980)
     .     105,  0, 10221,
c kaon
     .     106, -1,   311,
     .     106,  1,   321,
c eta'
     .     107,  0,   331,
c k*(892)
     .     108, -1,   313,
     .     108,  1,   323,
c phi
     .     109,  0,   333,
c k0*(1430)
     .     110, -1, 10321,
     .     110,  1, 10311,
c a0(980)
     .     111, -2,-10211,
     .     111,  0, 10111,
     .     111,  2, 10211,
c f0(1370)
     .     112,  0, 10221,
c k1(1270)
     .     113, -1, 10313,
     .     113,  1, 10323,
c a1(1260)
     .     114, -2,-20213,
     .     114,  0, 20113,
     .     114,  2, 20213,
c f1(1285)
     .     115,  0, 20223,
c f1'(1510)
     .     116,  0, 40223,
c k2*(1430)
     .     117, -1,   315,
     .     117,  1,   325,
c a2(1329)
     .     118, -2,  -215,
     .     118,  0,   115,
     .     118,  2,   215,
c f2(1270)
     .     119,  0,   225,
c f2'(1525)
     .     120,  0,   335,
c k1(1400)
     .     121, -1, 20313,
     .     121,  1, 20323,
c b1
     .     122, -2,-10213,
     .     122,  0, 10113,
     .     122,  2, 10213,
c h1
     .     123,  0, 10223,
c K* (1410)
     .     125, -1, 100313,
     .     125,  1, 100323,
c rho (1450)
     .     126, -2,-100213,
     .     126,  0, 100113,
     .     126,  2, 100213,
c omega (1420)
     .     127,  0, 100223,
c phi(1680)
     .     128,  0, 100333,
c k*(1680)
     .     129, -1, 30313,
     .     129,  1, 30323,
c rho(1700)
     .     130, -2,-30213,
     .     130,  0, 30113,
     .     130,  2, 30213,
c omega(1600)
     .     131,  0, 30223,
c phi(1850)     
     .     132,  0,   337 / 


cb search for the ITYP in IDTAB


      do 99 i=1,TAB_SIZE
         if(idtab(3,i).eq.pdgid) then
            ityp=idtab(1,i)
            iso3=idtab(2,i)
            return
         elseif((pdgid.lt.0).and.(idtab(3,i).eq.abs(pdgid))) then
            ityp=-1*idtab(1,i)
            iso3=-1*idtab(2,i)
            return
         endif
 99   continue

      ityp=99
      iso3=0
      return

c      write(6,*) ' fatal error in pdg2ityp: unknown PDG-Id: ',pdgid
c      stop

c handle all unknown ityps

      end




