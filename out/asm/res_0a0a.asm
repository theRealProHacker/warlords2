; res_0a0a file_off 0xc0a0

res_0a0a_0005:  ; ENTRY
  0005  55               push bp                                  
  0006  8bec             mov bp, sp                               
  0008  83ec08           sub sp, 8                                
  000b  c45e06           les bx, ptr [bp + 6]                     
  000e  6626837f0c00     cmp dword ptr es:[bx + 0xc], 0           
  0014  740b             je 0x21                                  
  0016  ff7608           push word ptr [bp + 8]                   
  0019  53               push bx                                  
  001a  90               nop                                      
  001b  0e               push cs                                  
  001c  e89f02           call 0x2be                               
  001f  eb09             jmp 0x2a                                 
  0021  66ff7606         push dword ptr [bp + 6]                  
  0025  9a01007107       lcall 0x771, 1                           -> 0771:0001
  002a  83c404           add sp, 4                                
  002d  833e6a1600       cmp word ptr [0x166a], 0                 
  0032  7503             jne 0x37                                 
  0034  e98502           jmp 0x2bc                                
  0037  c45e06           les bx, ptr [bp + 6]                     
  003a  26ff37           push word ptr es:[bx]                    
  003d  9a3700be07       lcall 0x7be, 0x37                        -> 07be:0037
  0042  59               pop cx                                   
  0043  0bc0             or ax, ax                                
  0045  7503             jne 0x4a                                 
  0047  e97202           jmp 0x2bc                                
  004a  6a00             push 0                                   
  004c  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0051  59               pop cx                                   
  0052  c45e06           les bx, ptr [bp + 6]                     
  0055  268a470b         mov al, byte ptr es:[bx + 0xb]           
  0059  b400             mov ah, 0                                
  005b  050300           add ax, 3                                
  005e  50               push ax                                  
  005f  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0063  b400             mov ah, 0                                
  0065  050300           add ax, 3                                
  0068  50               push ax                                  
  0069  268b4708         mov ax, word ptr es:[bx + 8]             
  006d  2d0200           sub ax, 2                                
  0070  50               push ax                                  
  0071  268b4706         mov ax, word ptr es:[bx + 6]             
  0075  2d0200           sub ax, 2                                
  0078  50               push ax                                  
  0079  16               push ss                                  
  007a  8d46f8           lea ax, [bp - 8]                         
  007d  50               push ax                                  
  007e  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0083  83c40c           add sp, 0xc                              
  0086  8b46fc           mov ax, word ptr [bp - 4]                
  0089  05feff           add ax, 0xfffe                           
  008c  50               push ax                                  
  008d  ff76fa           push word ptr [bp - 6]                   
  0090  8b46f8           mov ax, word ptr [bp - 8]                
  0093  40               inc ax                                   
  0094  50               push ax                                  
  0095  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  009a  83c406           add sp, 6                                
  009d  6a02             push 2                                   
  009f  ff76fa           push word ptr [bp - 6]                   
  00a2  8b46f8           mov ax, word ptr [bp - 8]                
  00a5  0346fc           add ax, word ptr [bp - 4]                
  00a8  48               dec ax                                   
  00a9  50               push ax                                  
  00aa  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  00af  83c406           add sp, 6                                
  00b2  6a02             push 2                                   
  00b4  8b46fa           mov ax, word ptr [bp - 6]                
  00b7  40               inc ax                                   
  00b8  50               push ax                                  
  00b9  8b46f8           mov ax, word ptr [bp - 8]                
  00bc  0346fc           add ax, word ptr [bp - 4]                
  00bf  48               dec ax                                   
  00c0  50               push ax                                  
  00c1  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  00c6  83c406           add sp, 6                                
  00c9  8b46fe           mov ax, word ptr [bp - 2]                
  00cc  05feff           add ax, 0xfffe                           
  00cf  50               push ax                                  
  00d0  8b46fa           mov ax, word ptr [bp - 6]                
  00d3  40               inc ax                                   
  00d4  50               push ax                                  
  00d5  8b46f8           mov ax, word ptr [bp - 8]                
  00d8  0346fc           add ax, word ptr [bp - 4]                
  00db  50               push ax                                  
  00dc  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  00e1  83c406           add sp, 6                                
  00e4  6a02             push 2                                   
  00e6  8b46fa           mov ax, word ptr [bp - 6]                
  00e9  0346fe           add ax, word ptr [bp - 2]                
  00ec  48               dec ax                                   
  00ed  50               push ax                                  
  00ee  8b46f8           mov ax, word ptr [bp - 8]                
  00f1  0346fc           add ax, word ptr [bp - 4]                
  00f4  48               dec ax                                   
  00f5  50               push ax                                  
  00f6  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  00fb  83c406           add sp, 6                                
  00fe  6a02             push 2                                   
  0100  8b46fa           mov ax, word ptr [bp - 6]                
  0103  0346fe           add ax, word ptr [bp - 2]                
  0106  48               dec ax                                   
  0107  50               push ax                                  
  0108  8b46f8           mov ax, word ptr [bp - 8]                
  010b  0346fc           add ax, word ptr [bp - 4]                
  010e  48               dec ax                                   
  010f  50               push ax                                  
  0110  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0115  83c406           add sp, 6                                
  0118  8b46fc           mov ax, word ptr [bp - 4]                
  011b  05feff           add ax, 0xfffe                           
  011e  50               push ax                                  
  011f  8b46fa           mov ax, word ptr [bp - 6]                
  0122  0346fe           add ax, word ptr [bp - 2]                
  0125  50               push ax                                  
  0126  8b46f8           mov ax, word ptr [bp - 8]                
  0129  40               inc ax                                   
  012a  50               push ax                                  
  012b  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0130  83c406           add sp, 6                                
  0133  6a02             push 2                                   
  0135  8b46fa           mov ax, word ptr [bp - 6]                
  0138  0346fe           add ax, word ptr [bp - 2]                
  013b  48               dec ax                                   
  013c  50               push ax                                  
  013d  8b46f8           mov ax, word ptr [bp - 8]                
  0140  40               inc ax                                   
  0141  50               push ax                                  
  0142  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0147  83c406           add sp, 6                                
  014a  6a02             push 2                                   
  014c  8b46fa           mov ax, word ptr [bp - 6]                
  014f  0346fe           add ax, word ptr [bp - 2]                
  0152  48               dec ax                                   
  0153  50               push ax                                  
  0154  ff76f8           push word ptr [bp - 8]                   
  0157  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  015c  83c406           add sp, 6                                
  015f  8b46fe           mov ax, word ptr [bp - 2]                
  0162  05feff           add ax, 0xfffe                           
  0165  50               push ax                                  
  0166  8b46fa           mov ax, word ptr [bp - 6]                
  0169  40               inc ax                                   
  016a  50               push ax                                  
  016b  ff76f8           push word ptr [bp - 8]                   
  016e  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0173  83c406           add sp, 6                                
  0176  6a02             push 2                                   
  0178  8b46fa           mov ax, word ptr [bp - 6]                
  017b  40               inc ax                                   
  017c  50               push ax                                  
  017d  ff76f8           push word ptr [bp - 8]                   
  0180  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0185  83c406           add sp, 6                                
  0188  6a02             push 2                                   
  018a  ff76fa           push word ptr [bp - 6]                   
  018d  8b46f8           mov ax, word ptr [bp - 8]                
  0190  40               inc ax                                   
  0191  50               push ax                                  
  0192  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0197  83c406           add sp, 6                                
  019a  ff4ef8           dec word ptr [bp - 8]                    
  019d  ff4efa           dec word ptr [bp - 6]                    
  01a0  8346fc02         add word ptr [bp - 4], 2                 
  01a4  8346fe02         add word ptr [bp - 2], 2                 
  01a8  8b46fc           mov ax, word ptr [bp - 4]                
  01ab  05feff           add ax, 0xfffe                           
  01ae  50               push ax                                  
  01af  ff76fa           push word ptr [bp - 6]                   
  01b2  8b46f8           mov ax, word ptr [bp - 8]                
  01b5  40               inc ax                                   
  01b6  50               push ax                                  
  01b7  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  01bc  83c406           add sp, 6                                
  01bf  6a02             push 2                                   
  01c1  ff76fa           push word ptr [bp - 6]                   
  01c4  8b46f8           mov ax, word ptr [bp - 8]                
  01c7  0346fc           add ax, word ptr [bp - 4]                
  01ca  48               dec ax                                   
  01cb  50               push ax                                  
  01cc  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  01d1  83c406           add sp, 6                                
  01d4  6a02             push 2                                   
  01d6  8b46fa           mov ax, word ptr [bp - 6]                
  01d9  40               inc ax                                   
  01da  50               push ax                                  
  01db  8b46f8           mov ax, word ptr [bp - 8]                
  01de  0346fc           add ax, word ptr [bp - 4]                
  01e1  48               dec ax                                   
  01e2  50               push ax                                  
  01e3  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  01e8  83c406           add sp, 6                                
  01eb  8b46fe           mov ax, word ptr [bp - 2]                
  01ee  05feff           add ax, 0xfffe                           
  01f1  50               push ax                                  
  01f2  8b46fa           mov ax, word ptr [bp - 6]                
  01f5  40               inc ax                                   
  01f6  50               push ax                                  
  01f7  8b46f8           mov ax, word ptr [bp - 8]                
  01fa  0346fc           add ax, word ptr [bp - 4]                
  01fd  50               push ax                                  
  01fe  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0203  83c406           add sp, 6                                
  0206  6a02             push 2                                   
  0208  8b46fa           mov ax, word ptr [bp - 6]                
  020b  0346fe           add ax, word ptr [bp - 2]                
  020e  48               dec ax                                   
  020f  50               push ax                                  
  0210  8b46f8           mov ax, word ptr [bp - 8]                
  0213  0346fc           add ax, word ptr [bp - 4]                
  0216  48               dec ax                                   
  0217  50               push ax                                  
  0218  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  021d  83c406           add sp, 6                                
  0220  6a02             push 2                                   
  0222  8b46fa           mov ax, word ptr [bp - 6]                
  0225  0346fe           add ax, word ptr [bp - 2]                
  0228  48               dec ax                                   
  0229  50               push ax                                  
  022a  8b46f8           mov ax, word ptr [bp - 8]                
  022d  0346fc           add ax, word ptr [bp - 4]                
  0230  48               dec ax                                   
  0231  50               push ax                                  
  0232  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0237  83c406           add sp, 6                                
  023a  8b46fc           mov ax, word ptr [bp - 4]                
  023d  05feff           add ax, 0xfffe                           
  0240  50               push ax                                  
  0241  8b46fa           mov ax, word ptr [bp - 6]                
  0244  0346fe           add ax, word ptr [bp - 2]                
  0247  50               push ax                                  
  0248  8b46f8           mov ax, word ptr [bp - 8]                
  024b  40               inc ax                                   
  024c  50               push ax                                  
  024d  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0252  83c406           add sp, 6                                
  0255  6a02             push 2                                   
  0257  8b46fa           mov ax, word ptr [bp - 6]                
  025a  0346fe           add ax, word ptr [bp - 2]                
  025d  48               dec ax                                   
  025e  50               push ax                                  
  025f  8b46f8           mov ax, word ptr [bp - 8]                
  0262  40               inc ax                                   
  0263  50               push ax                                  
  0264  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0269  83c406           add sp, 6                                
  026c  6a02             push 2                                   
  026e  8b46fa           mov ax, word ptr [bp - 6]                
  0271  0346fe           add ax, word ptr [bp - 2]                
  0274  48               dec ax                                   
  0275  50               push ax                                  
  0276  ff76f8           push word ptr [bp - 8]                   
  0279  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  027e  83c406           add sp, 6                                
  0281  8b46fe           mov ax, word ptr [bp - 2]                
  0284  05feff           add ax, 0xfffe                           
  0287  50               push ax                                  
  0288  8b46fa           mov ax, word ptr [bp - 6]                
  028b  40               inc ax                                   
  028c  50               push ax                                  
  028d  ff76f8           push word ptr [bp - 8]                   
  0290  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0295  83c406           add sp, 6                                
  0298  6a02             push 2                                   
  029a  8b46fa           mov ax, word ptr [bp - 6]                
  029d  40               inc ax                                   
  029e  50               push ax                                  
  029f  ff76f8           push word ptr [bp - 8]                   
  02a2  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  02a7  83c406           add sp, 6                                
  02aa  6a02             push 2                                   
  02ac  ff76fa           push word ptr [bp - 6]                   
  02af  8b46f8           mov ax, word ptr [bp - 8]                
  02b2  40               inc ax                                   
  02b3  50               push ax                                  
  02b4  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  02b9  83c406           add sp, 6                                
  02bc  c9               leave                                    
  02bd  cb               retf                                     

res_0a0a_02be:  ; ENTRY
  02be  55               push bp                                  
  02bf  8bec             mov bp, sp                               
  02c1  83ec0e           sub sp, 0xe                              
  02c4  56               push si                                  
  02c5  c45e06           les bx, ptr [bp + 6]                     
  02c8  268a4710         mov al, byte ptr es:[bx + 0x10]          
  02cc  b400             mov ah, 0                                
  02ce  0bc0             or ax, ax                                
  02d0  7508             jne 0x2da                                
  02d2  c746f20300       mov word ptr [bp - 0xe], 3               
  02d7  be0200           mov si, 2                                
  02da  16               push ss                                  
  02db  8d46f4           lea ax, [bp - 0xc]                       
  02de  50               push ax                                  
  02df  16               push ss                                  
  02e0  8d46f6           lea ax, [bp - 0xa]                       
  02e3  50               push ax                                  
  02e4  c45e06           les bx, ptr [bp + 6]                     
  02e7  6626ff770c       push dword ptr es:[bx + 0xc]             
  02ec  9ab80ae211       lcall 0x11e2, 0xab8                      -> 11e2:0ab8
  02f1  83c40c           add sp, 0xc                              
  02f4  c45e06           les bx, ptr [bp + 6]                     
  02f7  268a470a         mov al, byte ptr es:[bx + 0xa]           
  02fb  b400             mov ah, 0                                
  02fd  0bc0             or ax, ax                                
  02ff  7410             je 0x311                                 
  0301  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0305  b400             mov ah, 0                                
  0307  8b56f6           mov dx, word ptr [bp - 0xa]              
  030a  83c202           add dx, 2                                
  030d  3bc2             cmp ax, dx                               
  030f  7d0c             jge 0x31d                                
  0311  c45e06           les bx, ptr [bp + 6]                     
  0314  8a46f6           mov al, byte ptr [bp - 0xa]              
  0317  0404             add al, 4                                
  0319  2688470a         mov byte ptr es:[bx + 0xa], al           
  031d  c45e06           les bx, ptr [bp + 6]                     
  0320  268a470b         mov al, byte ptr es:[bx + 0xb]           
  0324  b400             mov ah, 0                                
  0326  0bc0             or ax, ax                                
  0328  7410             je 0x33a                                 
  032a  268a470b         mov al, byte ptr es:[bx + 0xb]           
  032e  b400             mov ah, 0                                
  0330  8b56f4           mov dx, word ptr [bp - 0xc]              
  0333  83c202           add dx, 2                                
  0336  3bc2             cmp ax, dx                               
  0338  7d0c             jge 0x346                                
  033a  c45e06           les bx, ptr [bp + 6]                     
  033d  8a46f4           mov al, byte ptr [bp - 0xc]              
  0340  0405             add al, 5                                
  0342  2688470b         mov byte ptr es:[bx + 0xb], al           
  0346  ff76f2           push word ptr [bp - 0xe]                 
  0349  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  034e  59               pop cx                                   
  034f  c45e06           les bx, ptr [bp + 6]                     
  0352  268a470b         mov al, byte ptr es:[bx + 0xb]           
  0356  b400             mov ah, 0                                
  0358  50               push ax                                  
  0359  268a470a         mov al, byte ptr es:[bx + 0xa]           
  035d  b400             mov ah, 0                                
  035f  50               push ax                                  
  0360  26ff7708         push word ptr es:[bx + 8]                
  0364  26ff7706         push word ptr es:[bx + 6]                
  0368  16               push ss                                  
  0369  8d46f8           lea ax, [bp - 8]                         
  036c  50               push ax                                  
  036d  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0372  83c40c           add sp, 0xc                              
  0375  52               push dx                                  
  0376  50               push ax                                  
  0377  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  037c  83c404           add sp, 4                                
  037f  c45e06           les bx, ptr [bp + 6]                     
  0382  268a4704         mov al, byte ptr es:[bx + 4]             
  0386  b400             mov ah, 0                                
  0388  0bc0             or ax, ax                                
  038a  740c             je 0x398                                 
  038c  3d0100           cmp ax, 1                                
  038f  741e             je 0x3af                                 
  0391  3d0200           cmp ax, 2                                
  0394  7432             je 0x3c8                                 
  0396  eb55             jmp 0x3ed                                
  0398  666800000300     push 0x30000                             
  039e  666800000f00     push 0xf0000                             
  03a4  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  03a9  83c408           add sp, 8                                
  03ac  56               push si                                  
  03ad  eb2f             jmp 0x3de                                
  03af  666800000300     push 0x30000                             
  03b5  666800000f00     push 0xf0000                             
  03bb  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  03c0  83c408           add sp, 8                                
  03c3  6a04             push 4                                   
  03c5  56               push si                                  
  03c6  eb18             jmp 0x3e0                                
  03c8  666800000300     push 0x30000                             
  03ce  666800000200     push 0x20000                             
  03d4  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  03d9  83c408           add sp, 8                                
  03dc  6a04             push 4                                   
  03de  6a04             push 4                                   
  03e0  16               push ss                                  
  03e1  8d46f8           lea ax, [bp - 8]                         
  03e4  50               push ax                                  
  03e5  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  03ea  83c408           add sp, 8                                
  03ed  c45e06           les bx, ptr [bp + 6]                     
  03f0  6626ff770c       push dword ptr es:[bx + 0xc]             
  03f5  268a470b         mov al, byte ptr es:[bx + 0xb]           
  03f9  b400             mov ah, 0                                
  03fb  2b46f4           sub ax, word ptr [bp - 0xc]              
  03fe  99               cdq                                      
  03ff  2bc2             sub ax, dx                               
  0401  d1f8             sar ax, 1                                
  0403  268b5708         mov dx, word ptr es:[bx + 8]             
  0407  03d0             add dx, ax                               
  0409  42               inc dx                                   
  040a  52               push dx                                  
  040b  268a470a         mov al, byte ptr es:[bx + 0xa]           
  040f  b400             mov ah, 0                                
  0411  2b46f6           sub ax, word ptr [bp - 0xa]              
  0414  99               cdq                                      
  0415  2bc2             sub ax, dx                               
  0417  d1f8             sar ax, 1                                
  0419  268b5706         mov dx, word ptr es:[bx + 6]             
  041d  03d0             add dx, ax                               
  041f  52               push dx                                  
  0420  9a0104e211       lcall 0x11e2, 0x401                      -> 11e2:0401
  0425  83c408           add sp, 8                                
  0428  5e               pop si                                   
  0429  c9               leave                                    
  042a  cb               retf                                     
  042b  55               push bp                                  
