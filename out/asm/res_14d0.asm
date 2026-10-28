; res_14d0 file_off 0x16d00

res_14d0_0002:  ; ENTRY
  0002  c8020000         enter 2, 0                               
  0006  c41e4970         les bx, ptr [0x7049]                     
  000a  268b475d         mov ax, word ptr es:[bx + 0x5d]          
  000e  8946fe           mov word ptr [bp - 2], ax                
  0011  c41e4970         les bx, ptr [0x7049]                     
  0015  8b4606           mov ax, word ptr [bp + 6]                
  0018  2689475d         mov word ptr es:[bx + 0x5d], ax          
  001c  8b46fe           mov ax, word ptr [bp - 2]                
  001f  eb00             jmp 0x21                                 
  0021  c9               leave                                    
  0022  cb               retf                                     
  0023  55               push bp                                  
  0024  8bec             mov bp, sp                               
  0026  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  002b  c41e4970         les bx, ptr [0x7049]                     
  002f  26ff775d         push word ptr es:[bx + 0x5d]             
  0033  c41e4970         les bx, ptr [0x7049]                     
  0037  8b4608           mov ax, word ptr [bp + 8]                
  003a  2603470a         add ax, word ptr es:[bx + 0xa]           
  003e  50               push ax                                  
  003f  c41e4970         les bx, ptr [0x7049]                     
  0043  8b4606           mov ax, word ptr [bp + 6]                
  0046  26034708         add ax, word ptr es:[bx + 8]             
  004a  50               push ax                                  
  004b  c41e4970         les bx, ptr [0x7049]                     
  004f  26ff7706         push word ptr es:[bx + 6]                
  0053  26ff7704         push word ptr es:[bx + 4]                
  0057  ff1ed069         lcall [0x69d0]                           
  005b  83c40a           add sp, 0xa                              
  005e  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0063  5d               pop bp                                   
  0064  cb               retf                                     

res_14d0_0065:  ; ENTRY
  0065  55               push bp                                  
  0066  8bec             mov bp, sp                               
  0068  c41e4970         les bx, ptr [0x7049]                     
  006c  26ff775d         push word ptr es:[bx + 0x5d]             
  0070  c41e4970         les bx, ptr [0x7049]                     
  0074  8b4608           mov ax, word ptr [bp + 8]                
  0077  2603470a         add ax, word ptr es:[bx + 0xa]           
  007b  50               push ax                                  
  007c  c41e4970         les bx, ptr [0x7049]                     
  0080  8b4606           mov ax, word ptr [bp + 6]                
  0083  26034708         add ax, word ptr es:[bx + 8]             
  0087  50               push ax                                  
  0088  c41e4970         les bx, ptr [0x7049]                     
  008c  26ff7706         push word ptr es:[bx + 6]                
  0090  26ff7704         push word ptr es:[bx + 4]                
  0094  ff1ed069         lcall [0x69d0]                           
  0098  83c40a           add sp, 0xa                              
  009b  5d               pop bp                                   
  009c  cb               retf                                     

res_14d0_009d:  ; ENTRY
  009d  55               push bp                                  
  009e  8bec             mov bp, sp                               
  00a0  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  00a5  c41e4970         les bx, ptr [0x7049]                     
  00a9  8b4610           mov ax, word ptr [bp + 0x10]             
  00ac  2603470a         add ax, word ptr es:[bx + 0xa]           
  00b0  50               push ax                                  
  00b1  c41e4970         les bx, ptr [0x7049]                     
  00b5  8b460e           mov ax, word ptr [bp + 0xe]              
  00b8  26034708         add ax, word ptr es:[bx + 8]             
  00bc  50               push ax                                  
  00bd  c41e4970         les bx, ptr [0x7049]                     
  00c1  26ff7706         push word ptr es:[bx + 6]                
  00c5  26ff7704         push word ptr es:[bx + 4]                
  00c9  c45e0a           les bx, ptr [bp + 0xa]                   
  00cc  26ff7706         push word ptr es:[bx + 6]                
  00d0  c45e0a           les bx, ptr [bp + 0xa]                   
  00d3  26ff7704         push word ptr es:[bx + 4]                
  00d7  c45e0a           les bx, ptr [bp + 0xa]                   
  00da  26ff7702         push word ptr es:[bx + 2]                
  00de  c45e0a           les bx, ptr [bp + 0xa]                   
  00e1  26ff37           push word ptr es:[bx]                    
  00e4  ff7608           push word ptr [bp + 8]                   
  00e7  ff7606           push word ptr [bp + 6]                   
  00ea  ff1ed469         lcall [0x69d4]                           
  00ee  83c414           add sp, 0x14                             
  00f1  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  00f6  5d               pop bp                                   
  00f7  cb               retf                                     

res_14d0_00f8:  ; ENTRY
  00f8  55               push bp                                  
  00f9  8bec             mov bp, sp                               
  00fb  56               push si                                  
  00fc  57               push di                                  
  00fd  8b760e           mov si, word ptr [bp + 0xe]              
  0100  8b7e10           mov di, word ptr [bp + 0x10]             
  0103  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0108  c41e4970         les bx, ptr [0x7049]                     
  010c  26037708         add si, word ptr es:[bx + 8]             
  0110  c41e4970         les bx, ptr [0x7049]                     
  0114  26037f0a         add di, word ptr es:[bx + 0xa]           
  0118  833e843300       cmp word ptr [0x3384], 0                 
  011d  7503             jne 0x122                                
  011f  e91201           jmp 0x234                                
  0122  c45e0a           les bx, ptr [bp + 0xa]                   
  0125  26ff7706         push word ptr es:[bx + 6]                
  0129  c45e0a           les bx, ptr [bp + 0xa]                   
  012c  268b4704         mov ax, word ptr es:[bx + 4]             
  0130  051e00           add ax, 0x1e                             
  0133  50               push ax                                  
  0134  1e               push ds                                  
  0135  680837           push 0x3708                              
  0138  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  013d  83c408           add sp, 8                                
  0140  6a00             push 0                                   
  0142  1e               push ds                                  
  0143  680837           push 0x3708                              
  0146  9acc071210       lcall 0x1012, 0x7cc                      -> 1012:07cc
  014b  83c406           add sp, 6                                
  014e  6a00             push 0                                   
  0150  8bc6             mov ax, si                               
  0152  250f00           and ax, 0xf                              
  0155  50               push ax                                  
  0156  1e               push ds                                  
  0157  680837           push 0x3708                              
  015a  c45e0a           les bx, ptr [bp + 0xa]                   
  015d  26ff7706         push word ptr es:[bx + 6]                
  0161  c45e0a           les bx, ptr [bp + 0xa]                   
  0164  26ff7704         push word ptr es:[bx + 4]                
  0168  c45e0a           les bx, ptr [bp + 0xa]                   
  016b  26ff7702         push word ptr es:[bx + 2]                
  016f  c45e0a           les bx, ptr [bp + 0xa]                   
  0172  26ff37           push word ptr es:[bx]                    
  0175  ff7608           push word ptr [bp + 8]                   
  0178  ff7606           push word ptr [bp + 6]                   
  017b  ff1ed469         lcall [0x69d4]                           
  017f  83c414           add sp, 0x14                             
  0182  c45e12           les bx, ptr [bp + 0x12]                  
  0185  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0189  b400             mov ah, 0                                
  018b  50               push ax                                  
  018c  c45e0a           les bx, ptr [bp + 0xa]                   
  018f  26ff7706         push word ptr es:[bx + 6]                
  0193  c45e0a           les bx, ptr [bp + 0xa]                   
  0196  268b4704         mov ax, word ptr es:[bx + 4]             
  019a  051e00           add ax, 0x1e                             
  019d  50               push ax                                  
  019e  1e               push ds                                  
  019f  684337           push 0x3743                              
  01a2  9a32021210       lcall 0x1012, 0x232                      -> 1012:0232
  01a7  83c40a           add sp, 0xa                              
  01aa  6a0f             push 0xf                                 
  01ac  1e               push ds                                  
  01ad  684337           push 0x3743                              
  01b0  9acc071210       lcall 0x1012, 0x7cc                      -> 1012:07cc
  01b5  83c406           add sp, 6                                
  01b8  6a00             push 0                                   
  01ba  8bc6             mov ax, si                               
  01bc  250f00           and ax, 0xf                              
  01bf  50               push ax                                  
  01c0  1e               push ds                                  
  01c1  684337           push 0x3743                              
  01c4  c45e0a           les bx, ptr [bp + 0xa]                   
  01c7  26ff7706         push word ptr es:[bx + 6]                
  01cb  c45e0a           les bx, ptr [bp + 0xa]                   
  01ce  26ff7704         push word ptr es:[bx + 4]                
  01d2  ff7618           push word ptr [bp + 0x18]                
  01d5  ff7616           push word ptr [bp + 0x16]                
  01d8  ff7614           push word ptr [bp + 0x14]                
  01db  ff7612           push word ptr [bp + 0x12]                
  01de  ff1ed469         lcall [0x69d4]                           
  01e2  83c414           add sp, 0x14                             
  01e5  6a00             push 0                                   
  01e7  6a00             push 0                                   
  01e9  1e               push ds                                  
  01ea  684337           push 0x3743                              
  01ed  57               push di                                  
  01ee  8bc6             mov ax, si                               
  01f0  25f0ff           and ax, 0xfff0                           
  01f3  50               push ax                                  
  01f4  c41e4970         les bx, ptr [0x7049]                     
  01f8  26ff7706         push word ptr es:[bx + 6]                
  01fc  26ff7704         push word ptr es:[bx + 4]                
  0200  c45e0a           les bx, ptr [bp + 0xa]                   
  0203  26ff7706         push word ptr es:[bx + 6]                
  0207  c45e0a           les bx, ptr [bp + 0xa]                   
  020a  268b4704         mov ax, word ptr es:[bx + 4]             
  020e  051e00           add ax, 0x1e                             
  0211  50               push ax                                  
  0212  6a00             push 0                                   
  0214  6a00             push 0                                   
  0216  1e               push ds                                  
  0217  680837           push 0x3708                              
  021a  ff1ec869         lcall [0x69c8]                           
  021e  83c41c           add sp, 0x1c                             
  0221  1e               push ds                                  
  0222  680837           push 0x3708                              
  0225  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  022a  83c404           add sp, 4                                
  022d  1e               push ds                                  
  022e  684337           push 0x3743                              
  0231  e9a000           jmp 0x2d4                                
  0234  c45e0a           les bx, ptr [bp + 0xa]                   
  0237  26ff7706         push word ptr es:[bx + 6]                
  023b  c45e0a           les bx, ptr [bp + 0xa]                   
  023e  268b4704         mov ax, word ptr es:[bx + 4]             
  0242  051e00           add ax, 0x1e                             
  0245  50               push ax                                  
  0246  1e               push ds                                  
  0247  680837           push 0x3708                              
  024a  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  024f  83c408           add sp, 8                                
  0252  6a00             push 0                                   
  0254  1e               push ds                                  
  0255  680837           push 0x3708                              
  0258  9acc071210       lcall 0x1012, 0x7cc                      -> 1012:07cc
  025d  83c406           add sp, 6                                
  0260  6a00             push 0                                   
  0262  8bc6             mov ax, si                               
  0264  250f00           and ax, 0xf                              
  0267  50               push ax                                  
  0268  1e               push ds                                  
  0269  680837           push 0x3708                              
  026c  c45e0a           les bx, ptr [bp + 0xa]                   
  026f  26ff7706         push word ptr es:[bx + 6]                
  0273  c45e0a           les bx, ptr [bp + 0xa]                   
  0276  26ff7704         push word ptr es:[bx + 4]                
  027a  c45e0a           les bx, ptr [bp + 0xa]                   
  027d  26ff7702         push word ptr es:[bx + 2]                
  0281  c45e0a           les bx, ptr [bp + 0xa]                   
  0284  26ff37           push word ptr es:[bx]                    
  0287  ff7608           push word ptr [bp + 8]                   
  028a  ff7606           push word ptr [bp + 6]                   
  028d  ff1ed469         lcall [0x69d4]                           
  0291  83c414           add sp, 0x14                             
  0294  6a00             push 0                                   
  0296  6a00             push 0                                   
  0298  6a00             push 0                                   
  029a  6a00             push 0                                   
  029c  57               push di                                  
  029d  8bc6             mov ax, si                               
  029f  25f0ff           and ax, 0xfff0                           
  02a2  50               push ax                                  
  02a3  c41e4970         les bx, ptr [0x7049]                     
  02a7  26ff7706         push word ptr es:[bx + 6]                
  02ab  26ff7704         push word ptr es:[bx + 4]                
  02af  c45e0a           les bx, ptr [bp + 0xa]                   
  02b2  26ff7706         push word ptr es:[bx + 6]                
  02b6  c45e0a           les bx, ptr [bp + 0xa]                   
  02b9  268b4704         mov ax, word ptr es:[bx + 4]             
  02bd  051e00           add ax, 0x1e                             
  02c0  50               push ax                                  
  02c1  6a00             push 0                                   
  02c3  6a00             push 0                                   
  02c5  1e               push ds                                  
  02c6  680837           push 0x3708                              
  02c9  ff1ec869         lcall [0x69c8]                           
  02cd  83c41c           add sp, 0x1c                             
  02d0  1e               push ds                                  
  02d1  680837           push 0x3708                              
  02d4  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  02d9  83c404           add sp, 4                                
  02dc  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  02e1  5f               pop di                                   
  02e2  5e               pop si                                   
  02e3  5d               pop bp                                   
  02e4  cb               retf                                     

res_14d0_02e5:  ; ENTRY
  02e5  55               push bp                                  
  02e6  8bec             mov bp, sp                               
  02e8  56               push si                                  
  02e9  57               push di                                  
  02ea  8b7e0a           mov di, word ptr [bp + 0xa]              
  02ed  8b760c           mov si, word ptr [bp + 0xc]              
  02f0  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  02f5  3bfe             cmp di, si                               
  02f7  7f03             jg 0x2fc                                 
  02f9  e99000           jmp 0x38c                                
  02fc  56               push si                                  
  02fd  0e               push cs                                  
  02fe  e801fd           call 2                                   
  0301  59               pop cx                                   
  0302  c45e06           les bx, ptr [bp + 6]                     
  0305  26ff7706         push word ptr es:[bx + 6]                
  0309  c45e06           les bx, ptr [bp + 6]                     
  030c  26ff7702         push word ptr es:[bx + 2]                
  0310  c45e06           les bx, ptr [bp + 6]                     
  0313  06               push es                                  
  0314  c47606           les si, ptr [bp + 6]                     
  0317  268b04           mov ax, word ptr es:[si]                 
  031a  07               pop es                                   
  031b  26034704         add ax, word ptr es:[bx + 4]             
  031f  48               dec ax                                   
  0320  50               push ax                                  
  0321  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0326  83c406           add sp, 6                                
  0329  c45e06           les bx, ptr [bp + 6]                     
  032c  26ff7704         push word ptr es:[bx + 4]                
  0330  c45e06           les bx, ptr [bp + 6]                     
  0333  268b4702         mov ax, word ptr es:[bx + 2]             
  0337  c45e06           les bx, ptr [bp + 6]                     
  033a  26034706         add ax, word ptr es:[bx + 6]             
  033e  48               dec ax                                   
  033f  50               push ax                                  
  0340  c45e06           les bx, ptr [bp + 6]                     
  0343  26ff37           push word ptr es:[bx]                    
  0346  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  034b  83c406           add sp, 6                                
  034e  57               push di                                  
  034f  0e               push cs                                  
  0350  e8affc           call 2                                   
  0353  59               pop cx                                   
  0354  c45e06           les bx, ptr [bp + 6]                     
  0357  26ff7704         push word ptr es:[bx + 4]                
  035b  c45e06           les bx, ptr [bp + 6]                     
  035e  26ff7702         push word ptr es:[bx + 2]                
  0362  c45e06           les bx, ptr [bp + 6]                     
  0365  26ff37           push word ptr es:[bx]                    
  0368  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  036d  83c406           add sp, 6                                
  0370  c45e06           les bx, ptr [bp + 6]                     
  0373  26ff7706         push word ptr es:[bx + 6]                
  0377  c45e06           les bx, ptr [bp + 6]                     
  037a  26ff7702         push word ptr es:[bx + 2]                
  037e  c45e06           les bx, ptr [bp + 6]                     
  0381  26ff37           push word ptr es:[bx]                    
  0384  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0389  e98d00           jmp 0x419                                
  038c  57               push di                                  
  038d  0e               push cs                                  
  038e  e871fc           call 2                                   
  0391  59               pop cx                                   
  0392  c45e06           les bx, ptr [bp + 6]                     
  0395  26ff7704         push word ptr es:[bx + 4]                
  0399  c45e06           les bx, ptr [bp + 6]                     
  039c  26ff7702         push word ptr es:[bx + 2]                
  03a0  c45e06           les bx, ptr [bp + 6]                     
  03a3  26ff37           push word ptr es:[bx]                    
  03a6  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  03ab  83c406           add sp, 6                                
  03ae  c45e06           les bx, ptr [bp + 6]                     
  03b1  26ff7706         push word ptr es:[bx + 6]                
  03b5  c45e06           les bx, ptr [bp + 6]                     
  03b8  26ff7702         push word ptr es:[bx + 2]                
  03bc  c45e06           les bx, ptr [bp + 6]                     
  03bf  26ff37           push word ptr es:[bx]                    
  03c2  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  03c7  83c406           add sp, 6                                
  03ca  56               push si                                  
  03cb  0e               push cs                                  
  03cc  e833fc           call 2                                   
  03cf  59               pop cx                                   
  03d0  c45e06           les bx, ptr [bp + 6]                     
  03d3  26ff7706         push word ptr es:[bx + 6]                
  03d7  c45e06           les bx, ptr [bp + 6]                     
  03da  26ff7702         push word ptr es:[bx + 2]                
  03de  c45e06           les bx, ptr [bp + 6]                     
  03e1  06               push es                                  
  03e2  c47606           les si, ptr [bp + 6]                     
  03e5  268b04           mov ax, word ptr es:[si]                 
  03e8  07               pop es                                   
  03e9  26034704         add ax, word ptr es:[bx + 4]             
  03ed  48               dec ax                                   
  03ee  50               push ax                                  
  03ef  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  03f4  83c406           add sp, 6                                
  03f7  c45e06           les bx, ptr [bp + 6]                     
  03fa  26ff7704         push word ptr es:[bx + 4]                
  03fe  c45e06           les bx, ptr [bp + 6]                     
  0401  268b4702         mov ax, word ptr es:[bx + 2]             
  0405  c45e06           les bx, ptr [bp + 6]                     
  0408  26034706         add ax, word ptr es:[bx + 6]             
  040c  48               dec ax                                   
  040d  50               push ax                                  
  040e  c45e06           les bx, ptr [bp + 6]                     
  0411  26ff37           push word ptr es:[bx]                    
  0414  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0419  83c406           add sp, 6                                
  041c  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0421  5f               pop di                                   
  0422  5e               pop si                                   
  0423  5d               pop bp                                   
  0424  cb               retf                                     
  0425  c8080000         enter 8, 0                               
  0429  56               push si                                  
  042a  6a08             push 8                                   
  042c  ff7608           push word ptr [bp + 8]                   
  042f  ff7606           push word ptr [bp + 6]                   
  0432  16               push ss                                  
  0433  8d46f8           lea ax, [bp - 8]                         
  0436  50               push ax                                  
  0437  9a45430000       lcall 0, 0x4345                          -> 0000:4345
  043c  83c40a           add sp, 0xa                              
  043f  c41e4970         les bx, ptr [0x7049]                     
  0443  06               push es                                  
  0444  c47606           les si, ptr [bp + 6]                     
  0447  268b04           mov ax, word ptr es:[si]                 
  044a  07               pop es                                   
  044b  26034708         add ax, word ptr es:[bx + 8]             
  044f  8946f8           mov word ptr [bp - 8], ax                
  0452  c41e4970         les bx, ptr [0x7049]                     
  0456  06               push es                                  
  0457  c47606           les si, ptr [bp + 6]                     
  045a  268b04           mov ax, word ptr es:[si]                 
  045d  07               pop es                                   
  045e  2603470a         add ax, word ptr es:[bx + 0xa]           
  0462  8946fa           mov word ptr [bp - 6], ax                
  0465  c41e4970         les bx, ptr [0x7049]                     
  0469  06               push es                                  
  046a  c47606           les si, ptr [bp + 6]                     
  046d  268b04           mov ax, word ptr es:[si]                 
  0470  07               pop es                                   
  0471  26034708         add ax, word ptr es:[bx + 8]             
  0475  8946f8           mov word ptr [bp - 8], ax                
  0478  ff760a           push word ptr [bp + 0xa]                 
  047b  16               push ss                                  
  047c  8d46f8           lea ax, [bp - 8]                         
  047f  50               push ax                                  
  0480  c41e4970         les bx, ptr [0x7049]                     
  0484  26ff7706         push word ptr es:[bx + 6]                
  0488  26ff7704         push word ptr es:[bx + 4]                
  048c  9a4f041210       lcall 0x1012, 0x44f                      -> 1012:044f
  0491  83c40a           add sp, 0xa                              
  0494  5e               pop si                                   
  0495  c9               leave                                    
  0496  cb               retf                                     

res_14d0_0497:  ; ENTRY
  0497  55               push bp                                  
  0498  8bec             mov bp, sp                               
  049a  56               push si                                  
  049b  c45e0a           les bx, ptr [bp + 0xa]                   
  049e  268b7702         mov si, word ptr es:[bx + 2]             
  04a2  eb20             jmp 0x4c4                                
  04a4  ff760e           push word ptr [bp + 0xe]                 
  04a7  c45e0a           les bx, ptr [bp + 0xa]                   
  04aa  26ff7704         push word ptr es:[bx + 4]                
  04ae  56               push si                                  
  04af  c45e0a           les bx, ptr [bp + 0xa]                   
  04b2  26ff37           push word ptr es:[bx]                    
  04b5  ff7608           push word ptr [bp + 8]                   
  04b8  ff7606           push word ptr [bp + 6]                   
  04bb  9ab70b1210       lcall 0x1012, 0xbb7                      -> 1012:0bb7
  04c0  83c40c           add sp, 0xc                              
  04c3  46               inc si                                   
  04c4  c45e0a           les bx, ptr [bp + 0xa]                   
  04c7  268b4702         mov ax, word ptr es:[bx + 2]             
  04cb  c45e0a           les bx, ptr [bp + 0xa]                   
  04ce  26034706         add ax, word ptr es:[bx + 6]             
  04d2  3bc6             cmp ax, si                               
  04d4  7fce             jg 0x4a4                                 
  04d6  5e               pop si                                   
  04d7  5d               pop bp                                   
  04d8  cb               retf                                     
  04d9  55               push bp                                  
