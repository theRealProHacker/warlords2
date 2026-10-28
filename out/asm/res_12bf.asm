; res_12bf file_off 0x14bf0

res_12bf_0004:  ; ENTRY
  0004  a17435           mov ax, word ptr [0x3574]                
  0007  eb00             jmp 9                                    
  0009  cb               retf                                     

res_12bf_000a:  ; ENTRY
  000a  55               push bp                                  
  000b  8bec             mov bp, sp                               
  000d  668b460e         mov eax, dword ptr [bp + 0xe]            
  0011  66a3146f         mov dword ptr [0x6f14], eax              
  0015  668b4606         mov eax, dword ptr [bp + 6]              
  0019  66a3106f         mov dword ptr [0x6f10], eax              
  001d  8b460a           mov ax, word ptr [bp + 0xa]              
  0020  a37e36           mov word ptr [0x367e], ax                
  0023  8b460c           mov ax, word ptr [bp + 0xc]              
  0026  a38236           mov word ptr [0x3682], ax                
  0029  5d               pop bp                                   
  002a  cb               retf                                     

res_12bf_002b:  ; ENTRY
  002b  55               push bp                                  
  002c  8bec             mov bp, sp                               
  002e  56               push si                                  
  002f  833e823600       cmp word ptr [0x3682], 0                 
  0034  740c             je 0x42                                  
  0036  1e               push ds                                  
  0037  687e35           push 0x357e                              
  003a  9acf091210       lcall 0x1012, 0x9cf                      -> 1012:09cf
  003f  83c404           add sp, 4                                
  0042  a1bb35           mov ax, word ptr [0x35bb]                
  0045  050f00           add ax, 0xf                              
  0048  25f0ff           and ax, 0xfff0                           
  004b  50               push ax                                  
  004c  a1b935           mov ax, word ptr [0x35b9]                
  004f  051f00           add ax, 0x1f                             
  0052  25e0ff           and ax, 0xffe0                           
  0055  50               push ax                                  
  0056  1e               push ds                                  
  0057  687e35           push 0x357e                              
  005a  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  005f  83c408           add sp, 8                                
  0062  0bc0             or ax, ax                                
  0064  7511             jne 0x77                                 
  0066  1e               push ds                                  
  0067  688436           push 0x3684                               ; "Cannot allocate saveBM"
  006a  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  006f  83c404           add sp, 4                                
  0072  33c0             xor ax, ax                               
  0074  e9aa01           jmp 0x221                                
  0077  66833e883500     cmp dword ptr [0x3588], 0                
  007d  7438             je 0xb7                                  
  007f  f706b3350a00     test word ptr [0x35b3], 0xa              
  0085  7530             jne 0xb7                                 
  0087  33f6             xor si, si                               
  0089  eb23             jmp 0xae                                 
  008b  8bde             mov bx, si                               
  008d  c1e302           shl bx, 2                                
  0090  ffb78a35         push word ptr [bx + 0x358a]              
  0094  ffb78835         push word ptr [bx + 0x3588]              
  0098  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  009d  83c404           add sp, 4                                
  00a0  8bde             mov bx, si                               
  00a2  c1e302           shl bx, 2                                
  00a5  89979a35         mov word ptr [bx + 0x359a], dx           
  00a9  89879835         mov word ptr [bx + 0x3598], ax           
  00ad  46               inc si                                   
  00ae  a0b235           mov al, byte ptr [0x35b2]                
  00b1  b400             mov ah, 0                                
  00b3  3bc6             cmp ax, si                               
  00b5  7fd4             jg 0x8b                                  
  00b7  833e823600       cmp word ptr [0x3682], 0                 
  00bc  740c             je 0xca                                  
  00be  1e               push ds                                  
  00bf  68bd35           push 0x35bd                              
  00c2  9acf091210       lcall 0x1012, 0x9cf                      -> 1012:09cf
  00c7  83c404           add sp, 4                                
  00ca  ff36bb35         push word ptr [0x35bb]                   
  00ce  a1b935           mov ax, word ptr [0x35b9]                
  00d1  050800           add ax, 8                                
  00d4  c1e003           shl ax, 3                                
  00d7  50               push ax                                  
  00d8  1e               push ds                                  
  00d9  68bd35           push 0x35bd                              
  00dc  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  00e1  83c408           add sp, 8                                
  00e4  0bc0             or ax, ax                                
  00e6  750c             jne 0xf4                                 
  00e8  1e               push ds                                  
  00e9  689c36           push 0x369c                               ; "Cannot allocate mouse bitmap"
  00ec  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  00f1  83c404           add sp, 4                                
  00f4  66833ec73500     cmp dword ptr [0x35c7], 0                
  00fa  7438             je 0x134                                 
  00fc  f706f2350a00     test word ptr [0x35f2], 0xa              
  0102  7530             jne 0x134                                
  0104  33f6             xor si, si                               
  0106  eb23             jmp 0x12b                                
  0108  8bde             mov bx, si                               
  010a  c1e302           shl bx, 2                                
  010d  ffb7c935         push word ptr [bx + 0x35c9]              
  0111  ffb7c735         push word ptr [bx + 0x35c7]              
  0115  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  011a  83c404           add sp, 4                                
  011d  8bde             mov bx, si                               
  011f  c1e302           shl bx, 2                                
  0122  8997d935         mov word ptr [bx + 0x35d9], dx           
  0126  8987d735         mov word ptr [bx + 0x35d7], ax           
  012a  46               inc si                                   
  012b  a0f135           mov al, byte ptr [0x35f1]                
  012e  b400             mov ah, 0                                
  0130  3bc6             cmp ax, si                               
  0132  7fd4             jg 0x108                                 
  0134  6a01             push 1                                   
  0136  ff36bb35         push word ptr [0x35bb]                   
  013a  a1b935           mov ax, word ptr [0x35b9]                
  013d  050800           add ax, 8                                
  0140  c1e003           shl ax, 3                                
  0143  50               push ax                                  
  0144  1e               push ds                                  
  0145  683336           push 0x3633                              
  0148  9a32021210       lcall 0x1012, 0x232                      -> 1012:0232
  014d  83c40a           add sp, 0xa                              
  0150  0bc0             or ax, ax                                
  0152  750c             jne 0x160                                
  0154  1e               push ds                                  
  0155  68ba36           push 0x36ba                               ; "Cannot allocate mouse mask bitmap"
  0158  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  015d  83c404           add sp, 4                                
  0160  66833e3d3600     cmp dword ptr [0x363d], 0                
  0166  7438             je 0x1a0                                 
  0168  f70668360a00     test word ptr [0x3668], 0xa              
  016e  7530             jne 0x1a0                                
  0170  33f6             xor si, si                               
  0172  eb23             jmp 0x197                                
  0174  8bde             mov bx, si                               
  0176  c1e302           shl bx, 2                                
  0179  ffb73f36         push word ptr [bx + 0x363f]              
  017d  ffb73d36         push word ptr [bx + 0x363d]              
  0181  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0186  83c404           add sp, 4                                
  0189  8bde             mov bx, si                               
  018b  c1e302           shl bx, 2                                
  018e  89974f36         mov word ptr [bx + 0x364f], dx           
  0192  89874d36         mov word ptr [bx + 0x364d], ax           
  0196  46               inc si                                   
  0197  a06736           mov al, byte ptr [0x3667]                
  019a  b400             mov ah, 0                                
  019c  3bc6             cmp ax, si                               
  019e  7fd4             jg 0x174                                 
  01a0  6a01             push 1                                   
  01a2  1e               push ds                                  
  01a3  683336           push 0x3633                              
  01a6  9ae3091210       lcall 0x1012, 0x9e3                      -> 1012:09e3
  01ab  83c406           add sp, 6                                
  01ae  837e0600         cmp word ptr [bp + 6], 0                 
  01b2  7408             je 0x1bc                                 
  01b4  c70674350000     mov word ptr [0x3574], 0                 
  01ba  eb13             jmp 0x1cf                                
  01bc  9a0200c00e       lcall 0xec0, 2                           -> 0ec0:0002
  01c1  0bc0             or ax, ax                                
  01c3  7405             je 0x1ca                                 
  01c5  b80100           mov ax, 1                                
  01c8  eb02             jmp 0x1cc                                
  01ca  33c0             xor ax, ax                               
  01cc  a37435           mov word ptr [0x3574], ax                
  01cf  6a00             push 0                                   
  01d1  90               nop                                      
  01d2  0e               push cs                                  
  01d3  e89901           call 0x36f                               
  01d6  59               pop cx                                   
  01d7  33c0             xor ax, ax                               
  01d9  a36a35           mov word ptr [0x356a], ax                
  01dc  a36835           mov word ptr [0x3568], ax                
  01df  ff366a35         push word ptr [0x356a]                   
  01e3  ff366835         push word ptr [0x3568]                   
  01e7  9a4600c00e       lcall 0xec0, 0x46                        -> 0ec0:0046
  01ec  83c404           add sp, 4                                
  01ef  833e743500       cmp word ptr [0x3574], 0                 
  01f4  7412             je 0x208                                 
  01f6  1e               push ds                                  
  01f7  686a35           push 0x356a                              
  01fa  1e               push ds                                  
  01fb  686835           push 0x3568                              
  01fe  90               nop                                      
  01ff  0e               push cs                                  
  0200  e8ba08           call 0xabd                               
  0203  83c408           add sp, 8                                
  0206  eb08             jmp 0x210                                
  0208  33c0             xor ax, ax                               
  020a  a36a35           mov word ptr [0x356a], ax                
  020d  a36835           mov word ptr [0x3568], ax                
  0210  c70670350100     mov word ptr [0x3570], 1                 
  0216  90               nop                                      
  0217  0e               push cs                                  
  0218  e83c05           call 0x757                               
  021b  a17435           mov ax, word ptr [0x3574]                
  021e  e953fe           jmp 0x74                                 
  0221  5e               pop si                                   
  0222  5d               pop bp                                   
  0223  cb               retf                                     

res_12bf_0224:  ; ENTRY
  0224  55               push bp                                  
  0225  8bec             mov bp, sp                               
  0227  56               push si                                  
  0228  57               push di                                  
  0229  8b760a           mov si, word ptr [bp + 0xa]              
  022c  8b7e0c           mov di, word ptr [bp + 0xc]              
  022f  c41ee734         les bx, ptr [0x34e7]                     
  0233  268b4706         mov ax, word ptr es:[bx + 6]             
  0237  bb1400           mov bx, 0x14                             
  023a  33d2             xor dx, dx                               
  023c  f7f3             div bx                                   
  023e  50               push ax                                  
  023f  c41ee734         les bx, ptr [0x34e7]                     
  0243  268b4704         mov ax, word ptr es:[bx + 4]             
  0247  f72eb469         imul word ptr [0x69b4]                   
  024b  50               push ax                                  
  024c  b80014           mov ax, 0x1400                           
  024f  33d2             xor dx, dx                               
  0251  5b               pop bx                                   
  0252  f7f3             div bx                                   
  0254  50               push ax                                  
  0255  9a3600c00e       lcall 0xec0, 0x36                        -> 0ec0:0036
  025a  83c404           add sp, 4                                
  025d  c41ee734         les bx, ptr [0x34e7]                     
  0261  268b5706         mov dx, word ptr es:[bx + 6]             
  0265  2b5608           sub dx, word ptr [bp + 8]                
  0268  03d7             add dx, di                               
  026a  a1b469           mov ax, word ptr [0x69b4]                
  026d  f7ea             imul dx                                  
  026f  50               push ax                                  
  0270  c41ee734         les bx, ptr [0x34e7]                     
  0274  268b5704         mov dx, word ptr es:[bx + 4]             
  0278  2b5606           sub dx, word ptr [bp + 6]                
  027b  03d6             add dx, si                               
  027d  a1b469           mov ax, word ptr [0x69b4]                
  0280  f7ea             imul dx                                  
  0282  50               push ax                                  
  0283  a1b469           mov ax, word ptr [0x69b4]                
  0286  f7ef             imul di                                  
  0288  50               push ax                                  
  0289  a1b469           mov ax, word ptr [0x69b4]                
  028c  f7ee             imul si                                  
  028e  50               push ax                                  
  028f  9a6700c00e       lcall 0xec0, 0x67                        -> 0ec0:0067
  0294  83c408           add sp, 8                                
  0297  5f               pop di                                   
  0298  5e               pop si                                   
  0299  5d               pop bp                                   
  029a  cb               retf                                     
  029b  55               push bp                                  
  029c  8bec             mov bp, sp                               
  029e  8b4606           mov ax, word ptr [bp + 6]                
  02a1  a36c35           mov word ptr [0x356c], ax                
  02a4  8b4608           mov ax, word ptr [bp + 8]                
  02a7  a36e35           mov word ptr [0x356e], ax                
  02aa  5d               pop bp                                   
  02ab  cb               retf                                     

res_12bf_02ac:  ; ENTRY
  02ac  833e743500       cmp word ptr [0x3574], 0                 
  02b1  741b             je 0x2ce                                 
  02b3  1e               push ds                                  
  02b4  680e6f           push 0x6f0e                              
  02b7  1e               push ds                                  
  02b8  680c6f           push 0x6f0c                              
  02bb  9a0e00c00e       lcall 0xec0, 0xe                         -> 0ec0:000e
  02c0  83c408           add sp, 8                                
  02c3  a16035           mov ax, word ptr [0x3560]                
  02c6  a30c6f           mov word ptr [0x6f0c], ax                
  02c9  a16235           mov ax, word ptr [0x3562]                
  02cc  eb09             jmp 0x2d7                                
  02ce  a16c35           mov ax, word ptr [0x356c]                
  02d1  a30c6f           mov word ptr [0x6f0c], ax                
  02d4  a16e35           mov ax, word ptr [0x356e]                
  02d7  a30e6f           mov word ptr [0x6f0e], ax                
  02da  a10c6f           mov ax, word ptr [0x6f0c]                
  02dd  3b066835         cmp ax, word ptr [0x3568]                
  02e1  750c             jne 0x2ef                                
  02e3  a10e6f           mov ax, word ptr [0x6f0e]                
  02e6  3b066a35         cmp ax, word ptr [0x356a]                
  02ea  7503             jne 0x2ef                                
  02ec  e97f00           jmp 0x36e                                
  02ef  833e703500       cmp word ptr [0x3570], 0                 
  02f4  7578             jne 0x36e                                
  02f6  a16a35           mov ax, word ptr [0x356a]                
  02f9  2b06186f         sub ax, word ptr [0x6f18]                
  02fd  50               push ax                                  
  02fe  a16835           mov ax, word ptr [0x3568]                
  0301  2b061a6f         sub ax, word ptr [0x6f1a]                
  0305  25f8ff           and ax, 0xfff8                           
  0308  50               push ax                                  
  0309  1e               push ds                                  
  030a  682a34           push 0x342a                              
  030d  ff367436         push word ptr [0x3674]                   
  0311  ff367036         push word ptr [0x3670]                   
  0315  6a00             push 0                                   
  0317  6a00             push 0                                   
  0319  1e               push ds                                  
  031a  687e35           push 0x357e                              
  031d  ff1ed469         lcall [0x69d4]                           
  0321  83c414           add sp, 0x14                             
  0324  6a00             push 0                                   
  0326  6a00             push 0                                   
  0328  1e               push ds                                  
  0329  687e35           push 0x357e                              
  032c  ff367436         push word ptr [0x3674]                   
  0330  ff367036         push word ptr [0x3670]                   
  0334  a10e6f           mov ax, word ptr [0x6f0e]                
  0337  2b06186f         sub ax, word ptr [0x6f18]                
  033b  50               push ax                                  
  033c  a10c6f           mov ax, word ptr [0x6f0c]                
  033f  2b061a6f         sub ax, word ptr [0x6f1a]                
  0343  25f8ff           and ax, 0xfff8                           
  0346  50               push ax                                  
  0347  1e               push ds                                  
  0348  682a34           push 0x342a                              
  034b  ff1ed469         lcall [0x69d4]                           
  034f  83c414           add sp, 0x14                             
  0352  ff360e6f         push word ptr [0x6f0e]                   
  0356  ff360c6f         push word ptr [0x6f0c]                   
  035a  90               nop                                      
  035b  0e               push cs                                  
  035c  e82e06           call 0x98d                               
  035f  83c404           add sp, 4                                
  0362  a10c6f           mov ax, word ptr [0x6f0c]                
  0365  a36835           mov word ptr [0x3568], ax                
  0368  a10e6f           mov ax, word ptr [0x6f0e]                
  036b  a36a35           mov word ptr [0x356a], ax                
  036e  cb               retf                                     

res_12bf_036f:  ; ENTRY
  036f  c8080000         enter 8, 0                               
  0373  56               push si                                  
  0374  57               push di                                  
  0375  8b7606           mov si, word ptr [bp + 6]                
  0378  39367c35         cmp word ptr [0x357c], si                
  037c  7503             jne 0x381                                
  037e  e9d203           jmp 0x753                                
  0381  833e6e3600       cmp word ptr [0x366e], 0                 
  0386  7435             je 0x3bd                                 
  0388  833e703500       cmp word ptr [0x3570], 0                 
  038d  752e             jne 0x3bd                                
  038f  a16a35           mov ax, word ptr [0x356a]                
  0392  2b06186f         sub ax, word ptr [0x6f18]                
  0396  50               push ax                                  
  0397  a16835           mov ax, word ptr [0x3568]                
  039a  2b061a6f         sub ax, word ptr [0x6f1a]                
  039e  25f8ff           and ax, 0xfff8                           
  03a1  50               push ax                                  
  03a2  1e               push ds                                  
  03a3  682a34           push 0x342a                              
  03a6  ff367436         push word ptr [0x3674]                   
  03aa  ff367036         push word ptr [0x3670]                   
  03ae  6a00             push 0                                   
  03b0  6a00             push 0                                   
  03b2  1e               push ds                                  
  03b3  687e35           push 0x357e                              
  03b6  ff1ed469         lcall [0x69d4]                           
  03ba  83c414           add sp, 0x14                             
  03bd  6a10             push 0x10                                
  03bf  6a10             push 0x10                                
  03c1  6a00             push 0                                   
  03c3  8bc6             mov ax, si                               
  03c5  c1e004           shl ax, 4                                
  03c8  50               push ax                                  
  03c9  16               push ss                                  
  03ca  8d46f8           lea ax, [bp - 8]                         
  03cd  50               push ax                                  
  03ce  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  03d3  83c40c           add sp, 0xc                              
  03d6  8b46fc           mov ax, word ptr [bp - 4]                
  03d9  050e00           add ax, 0xe                              
  03dc  25f8ff           and ax, 0xfff8                           
  03df  a37036           mov word ptr [0x3670], ax                
  03e2  c41e146f         les bx, ptr [0x6f14]                     
  03e6  26c45f02         les bx, ptr es:[bx + 2]                  
  03ea  8bc6             mov ax, si                               
  03ec  d1e0             shl ax, 1                                
  03ee  03d8             add bx, ax                               
  03f0  268b07           mov ax, word ptr es:[bx]                 
  03f3  a37236           mov word ptr [0x3672], ax                
  03f6  c41e146f         les bx, ptr [0x6f14]                     
  03fa  26c45f06         les bx, ptr es:[bx + 6]                  
  03fe  8bc6             mov ax, si                               
  0400  d1e0             shl ax, 1                                
  0402  03d8             add bx, ax                               
  0404  268b07           mov ax, word ptr es:[bx]                 
  0407  a37436           mov word ptr [0x3674], ax                
  040a  89367c35         mov word ptr [0x357c], si                
  040e  c41e146f         les bx, ptr [0x6f14]                     
  0412  26c45f0a         les bx, ptr es:[bx + 0xa]                
  0416  8bc6             mov ax, si                               
  0418  d1e0             shl ax, 1                                
  041a  03d8             add bx, ax                               
  041c  268b07           mov ax, word ptr es:[bx]                 
  041f  a31a6f           mov word ptr [0x6f1a], ax                
  0422  c41e146f         les bx, ptr [0x6f14]                     
  0426  26c45f0a         les bx, ptr es:[bx + 0xa]                
  042a  8bc6             mov ax, si                               
  042c  d1e0             shl ax, 1                                
  042e  03d8             add bx, ax                               
  0430  268b07           mov ax, word ptr es:[bx]                 
  0433  a3186f           mov word ptr [0x6f18], ax                
  0436  ff36186f         push word ptr [0x6f18]                   
  043a  ff361a6f         push word ptr [0x6f1a]                   
  043e  ff367436         push word ptr [0x3674]                   
  0442  ff367236         push word ptr [0x3672]                   
  0446  0e               push cs                                  
  0447  e8dafd           call 0x224                               
  044a  83c408           add sp, 8                                
  044d  ff36bb35         push word ptr [0x35bb]                   
  0451  a1b935           mov ax, word ptr [0x35b9]                
  0454  050800           add ax, 8                                
  0457  c1e003           shl ax, 3                                
  045a  50               push ax                                  
  045b  1e               push ds                                  
  045c  68f835           push 0x35f8                              
  045f  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  0464  83c408           add sp, 8                                
  0467  0bc0             or ax, ax                                
  0469  750c             jne 0x477                                
  046b  1e               push ds                                  
  046c  68dd36           push 0x36dd                               ; "Cannot allocate mouse temp bitmap"
  046f  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  0474  83c404           add sp, 4                                
  0477  66833e023600     cmp dword ptr [0x3602], 0                
  047d  7438             je 0x4b7                                 
  047f  f7062d360a00     test word ptr [0x362d], 0xa              
  0485  7530             jne 0x4b7                                
  0487  33f6             xor si, si                               
  0489  eb23             jmp 0x4ae                                
  048b  8bde             mov bx, si                               
  048d  c1e302           shl bx, 2                                
  0490  ffb70436         push word ptr [bx + 0x3604]              
  0494  ffb70236         push word ptr [bx + 0x3602]              
  0498  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  049d  83c404           add sp, 4                                
  04a0  8bde             mov bx, si                               
  04a2  c1e302           shl bx, 2                                
  04a5  89971436         mov word ptr [bx + 0x3614], dx           
  04a9  89871236         mov word ptr [bx + 0x3612], ax           
  04ad  46               inc si                                   
  04ae  a02c36           mov al, byte ptr [0x362c]                
  04b1  b400             mov ah, 0                                
  04b3  3bc6             cmp ax, si                               
  04b5  7fd4             jg 0x48b                                 
  04b7  ff367e36         push word ptr [0x367e]                   
  04bb  1e               push ds                                  
  04bc  68f835           push 0x35f8                              
  04bf  9acc071210       lcall 0x1012, 0x7cc                      -> 1012:07cc
  04c4  83c406           add sp, 6                                
  04c7  c41e106f         les bx, ptr [0x6f10]                     
  04cb  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  04d1  744d             je 0x520                                 
  04d3  c41e106f         les bx, ptr [0x6f10]                     
  04d7  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  04dd  7541             jne 0x520                                
  04df  33ff             xor di, di                               
  04e1  eb2f             jmp 0x512                                
  04e3  8bc7             mov ax, di                               
  04e5  c1e002           shl ax, 2                                
  04e8  c41e106f         les bx, ptr [0x6f10]                     
  04ec  03d8             add bx, ax                               
  04ee  26ff770c         push word ptr es:[bx + 0xc]              
  04f2  26ff770a         push word ptr es:[bx + 0xa]              
  04f6  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  04fb  83c404           add sp, 4                                
  04fe  8bdf             mov bx, di                               
  0500  c1e302           shl bx, 2                                
  0503  c436106f         les si, ptr [0x6f10]                     
  0507  03f3             add si, bx                               
  0509  2689541c         mov word ptr es:[si + 0x1c], dx          
  050d  2689441a         mov word ptr es:[si + 0x1a], ax          
  0511  47               inc di                                   
  0512  c41e106f         les bx, ptr [0x6f10]                     
  0516  268a4734         mov al, byte ptr es:[bx + 0x34]          
  051a  b400             mov ah, 0                                
  051c  3bc7             cmp ax, di                               
  051e  7fc3             jg 0x4e3                                 
  0520  bf0800           mov di, 8                                
  0523  33f6             xor si, si                               
  0525  eb2d             jmp 0x554                                
  0527  6a00             push 0                                   
  0529  a1b935           mov ax, word ptr [0x35b9]                
  052c  050800           add ax, 8                                
  052f  f7ee             imul si                                  
  0531  03c6             add ax, si                               
  0533  50               push ax                                  
  0534  1e               push ds                                  
  0535  68f835           push 0x35f8                              
  0538  ff76fe           push word ptr [bp - 2]                   
  053b  ff76fc           push word ptr [bp - 4]                   
  053e  ff76fa           push word ptr [bp - 6]                   
  0541  ff76f8           push word ptr [bp - 8]                   
  0544  ff36126f         push word ptr [0x6f12]                   
  0548  ff36106f         push word ptr [0x6f10]                   
  054c  ff1ed469         lcall [0x69d4]                           
  0550  83c414           add sp, 0x14                             
  0553  46               inc si                                   
  0554  8bc7             mov ax, di                               
  0556  4f               dec di                                   
  0557  0bc0             or ax, ax                                
  0559  75cc             jne 0x527                                
  055b  c41e106f         les bx, ptr [0x6f10]                     
  055f  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0565  743a             je 0x5a1                                 
  0567  c41e106f         les bx, ptr [0x6f10]                     
  056b  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0571  752e             jne 0x5a1                                
  0573  33f6             xor si, si                               
  0575  eb1c             jmp 0x593                                
  0577  8bc6             mov ax, si                               
  0579  c1e002           shl ax, 2                                
  057c  c41e106f         les bx, ptr [0x6f10]                     
  0580  03d8             add bx, ax                               
  0582  26ff770c         push word ptr es:[bx + 0xc]              
  0586  26ff770a         push word ptr es:[bx + 0xa]              
  058a  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  058f  83c404           add sp, 4                                
  0592  46               inc si                                   
  0593  c41e106f         les bx, ptr [0x6f10]                     
  0597  268a4734         mov al, byte ptr es:[bx + 0x34]          
  059b  b400             mov ah, 0                                
  059d  3bc6             cmp ax, si                               
  059f  7fd6             jg 0x577                                 
  05a1  ff367e36         push word ptr [0x367e]                   
  05a5  1e               push ds                                  
  05a6  683336           push 0x3633                              
  05a9  1e               push ds                                  
  05aa  68f835           push 0x35f8                              
  05ad  1e               push ds                                  
  05ae  688036           push 0x3680                              
  05b1  9acf001d15       lcall 0x151d, 0xcf                       -> 151d:00cf
  05b6  83c40e           add sp, 0xe                              
  05b9  66833ec73500     cmp dword ptr [0x35c7], 0                
  05bf  7438             je 0x5f9                                 
  05c1  f706f2350a00     test word ptr [0x35f2], 0xa              
  05c7  7530             jne 0x5f9                                
  05c9  33f6             xor si, si                               
  05cb  eb23             jmp 0x5f0                                
  05cd  8bde             mov bx, si                               
  05cf  c1e302           shl bx, 2                                
  05d2  ffb7c935         push word ptr [bx + 0x35c9]              
  05d6  ffb7c735         push word ptr [bx + 0x35c7]              
  05da  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  05df  83c404           add sp, 4                                
  05e2  8bde             mov bx, si                               
  05e4  c1e302           shl bx, 2                                
  05e7  8997d935         mov word ptr [bx + 0x35d9], dx           
  05eb  8987d735         mov word ptr [bx + 0x35d7], ax           
  05ef  46               inc si                                   
  05f0  a0f135           mov al, byte ptr [0x35f1]                
  05f3  b400             mov ah, 0                                
  05f5  3bc6             cmp ax, si                               
  05f7  7fd4             jg 0x5cd                                 
  05f9  66833e023600     cmp dword ptr [0x3602], 0                
  05ff  7438             je 0x639                                 
  0601  f7062d360a00     test word ptr [0x362d], 0xa              
  0607  7530             jne 0x639                                
  0609  33f6             xor si, si                               
  060b  eb23             jmp 0x630                                
  060d  8bde             mov bx, si                               
  060f  c1e302           shl bx, 2                                
  0612  ffb70436         push word ptr [bx + 0x3604]              
  0616  ffb70236         push word ptr [bx + 0x3602]              
  061a  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  061f  83c404           add sp, 4                                
  0622  8bde             mov bx, si                               
  0624  c1e302           shl bx, 2                                
  0627  89971436         mov word ptr [bx + 0x3614], dx           
  062b  89871236         mov word ptr [bx + 0x3612], ax           
  062f  46               inc si                                   
  0630  a02c36           mov al, byte ptr [0x362c]                
  0633  b400             mov ah, 0                                
  0635  3bc6             cmp ax, si                               
  0637  7fd4             jg 0x60d                                 
  0639  6a00             push 0                                   
  063b  6a00             push 0                                   
  063d  1e               push ds                                  
  063e  68bd35           push 0x35bd                              
  0641  ff36bb35         push word ptr [0x35bb]                   
  0645  a1b935           mov ax, word ptr [0x35b9]                
  0648  050800           add ax, 8                                
  064b  c1e003           shl ax, 3                                
  064e  50               push ax                                  
  064f  6a00             push 0                                   
  0651  6a00             push 0                                   
  0653  1e               push ds                                  
  0654  68f835           push 0x35f8                              
  0657  ff1ed469         lcall [0x69d4]                           
  065b  83c414           add sp, 0x14                             
  065e  1e               push ds                                  
  065f  68f835           push 0x35f8                              
  0662  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  0667  83c404           add sp, 4                                
  066a  c7066e360100     mov word ptr [0x366e], 1                 
  0670  8b46f8           mov ax, word ptr [bp - 8]                
  0673  a37636           mov word ptr [0x3676], ax                
  0676  8b46fa           mov ax, word ptr [bp - 6]                
  0679  a37836           mov word ptr [0x3678], ax                
  067c  8b46fc           mov ax, word ptr [bp - 4]                
  067f  a37a36           mov word ptr [0x367a], ax                
  0682  8b46fe           mov ax, word ptr [bp - 2]                
  0685  a37c36           mov word ptr [0x367c], ax                
  0688  1e               push ds                                  
  0689  686a35           push 0x356a                              
  068c  1e               push ds                                  
  068d  686835           push 0x3568                              
  0690  90               nop                                      
  0691  0e               push cs                                  
  0692  e82804           call 0xabd                               
  0695  83c408           add sp, 8                                
  0698  c41ee734         les bx, ptr [0x34e7]                     
  069c  a16835           mov ax, word ptr [0x3568]                
  069f  0346fc           add ax, word ptr [bp - 4]                
  06a2  26394704         cmp word ptr es:[bx + 4], ax             
  06a6  7d14             jge 0x6bc                                
  06a8  c41ee734         les bx, ptr [0x34e7]                     
  06ac  268b4704         mov ax, word ptr es:[bx + 4]             
  06b0  2b46fc           sub ax, word ptr [bp - 4]                
  06b3  03061a6f         add ax, word ptr [0x6f1a]                
  06b7  a36835           mov word ptr [0x3568], ax                
  06ba  eb0f             jmp 0x6cb                                
  06bc  a16835           mov ax, word ptr [0x3568]                
  06bf  3b061a6f         cmp ax, word ptr [0x6f1a]                
  06c3  7d06             jge 0x6cb                                
  06c5  a11a6f           mov ax, word ptr [0x6f1a]                
  06c8  a36835           mov word ptr [0x3568], ax                
  06cb  c41ee734         les bx, ptr [0x34e7]                     
  06cf  a16a35           mov ax, word ptr [0x356a]                
  06d2  0346fe           add ax, word ptr [bp - 2]                
  06d5  26394706         cmp word ptr es:[bx + 6], ax             
  06d9  7d14             jge 0x6ef                                
  06db  c41ee734         les bx, ptr [0x34e7]                     
  06df  268b4706         mov ax, word ptr es:[bx + 6]             
  06e3  2b46fe           sub ax, word ptr [bp - 2]                
  06e6  0306186f         add ax, word ptr [0x6f18]                
  06ea  a36a35           mov word ptr [0x356a], ax                
  06ed  eb0f             jmp 0x6fe                                
  06ef  a16a35           mov ax, word ptr [0x356a]                
  06f2  3b06186f         cmp ax, word ptr [0x6f18]                
  06f6  7d06             jge 0x6fe                                
  06f8  a1186f           mov ax, word ptr [0x6f18]                
  06fb  a36a35           mov word ptr [0x356a], ax                
  06fe  ff366a35         push word ptr [0x356a]                   
  0702  ff366835         push word ptr [0x3568]                   
  0706  9a4600c00e       lcall 0xec0, 0x46                        -> 0ec0:0046
  070b  83c404           add sp, 4                                
  070e  833e703500       cmp word ptr [0x3570], 0                 
  0713  753e             jne 0x753                                
  0715  6a00             push 0                                   
  0717  6a00             push 0                                   
  0719  1e               push ds                                  
  071a  687e35           push 0x357e                              
  071d  ff367436         push word ptr [0x3674]                   
  0721  ff367036         push word ptr [0x3670]                   
  0725  a16a35           mov ax, word ptr [0x356a]                
  0728  2b06186f         sub ax, word ptr [0x6f18]                
  072c  50               push ax                                  
  072d  a16835           mov ax, word ptr [0x3568]                
  0730  2b061a6f         sub ax, word ptr [0x6f1a]                
  0734  25f8ff           and ax, 0xfff8                           
  0737  50               push ax                                  
  0738  1e               push ds                                  
  0739  682a34           push 0x342a                              
  073c  ff1ed469         lcall [0x69d4]                           
  0740  83c414           add sp, 0x14                             
  0743  ff366a35         push word ptr [0x356a]                   
  0747  ff366835         push word ptr [0x3568]                   
  074b  90               nop                                      
  074c  0e               push cs                                  
  074d  e83d02           call 0x98d                               
  0750  83c404           add sp, 4                                
  0753  5f               pop di                                   
  0754  5e               pop si                                   
  0755  c9               leave                                    
  0756  cb               retf                                     

res_12bf_0757:  ; ENTRY
  0757  833e783500       cmp word ptr [0x3578], 0                 
  075c  7402             je 0x760                                 
  075e  eb44             jmp 0x7a4                                
  0760  ff0e7035         dec word ptr [0x3570]                    
  0764  7f3e             jg 0x7a4                                 
  0766  6a00             push 0                                   
  0768  6a00             push 0                                   
  076a  1e               push ds                                  
  076b  687e35           push 0x357e                              
  076e  ff367436         push word ptr [0x3674]                   
  0772  ff367036         push word ptr [0x3670]                   
  0776  a16a35           mov ax, word ptr [0x356a]                
  0779  2b06186f         sub ax, word ptr [0x6f18]                
  077d  50               push ax                                  
  077e  a16835           mov ax, word ptr [0x3568]                
  0781  2b061a6f         sub ax, word ptr [0x6f1a]                
  0785  25f8ff           and ax, 0xfff8                           
  0788  50               push ax                                  
  0789  1e               push ds                                  
  078a  682a34           push 0x342a                              
  078d  ff1ed469         lcall [0x69d4]                           
  0791  83c414           add sp, 0x14                             
  0794  ff366a35         push word ptr [0x356a]                   
  0798  ff366835         push word ptr [0x3568]                   
  079c  90               nop                                      
  079d  0e               push cs                                  
  079e  e8ec01           call 0x98d                               
  07a1  83c404           add sp, 4                                
  07a4  cb               retf                                     

res_12bf_07a5:  ; ENTRY
  07a5  833e783500       cmp word ptr [0x3578], 0                 
  07aa  7402             je 0x7ae                                 
  07ac  eb39             jmp 0x7e7                                
  07ae  a17035           mov ax, word ptr [0x3570]                
  07b1  ff067035         inc word ptr [0x3570]                    
  07b5  0bc0             or ax, ax                                
  07b7  752e             jne 0x7e7                                
  07b9  a16a35           mov ax, word ptr [0x356a]                
  07bc  2b06186f         sub ax, word ptr [0x6f18]                
  07c0  50               push ax                                  
  07c1  a16835           mov ax, word ptr [0x3568]                
  07c4  2b061a6f         sub ax, word ptr [0x6f1a]                
  07c8  25f8ff           and ax, 0xfff8                           
  07cb  50               push ax                                  
  07cc  1e               push ds                                  
  07cd  682a34           push 0x342a                              
  07d0  ff367436         push word ptr [0x3674]                   
  07d4  ff367036         push word ptr [0x3670]                   
  07d8  6a00             push 0                                   
  07da  6a00             push 0                                   
  07dc  1e               push ds                                  
  07dd  687e35           push 0x357e                              
  07e0  ff1ed469         lcall [0x69d4]                           
  07e4  83c414           add sp, 0x14                             
  07e7  cb               retf                                     

res_12bf_07e8:  ; ENTRY
  07e8  55               push bp                                  
  07e9  8bec             mov bp, sp                               
  07eb  c45e06           les bx, ptr [bp + 6]                     
  07ee  268b07           mov ax, word ptr es:[bx]                 
  07f1  2b067036         sub ax, word ptr [0x3670]                
  07f5  7d04             jge 0x7fb                                
  07f7  33c0             xor ax, ax                               
  07f9  eb0a             jmp 0x805                                
  07fb  c45e06           les bx, ptr [bp + 6]                     
  07fe  268b07           mov ax, word ptr es:[bx]                 
  0801  2b067036         sub ax, word ptr [0x3670]                
  0805  c45e06           les bx, ptr [bp + 6]                     
  0808  268907           mov word ptr es:[bx], ax                 
  080b  c45e06           les bx, ptr [bp + 6]                     
  080e  268b4702         mov ax, word ptr es:[bx + 2]             
  0812  2b067436         sub ax, word ptr [0x3674]                
  0816  7d04             jge 0x81c                                
  0818  33c0             xor ax, ax                               
  081a  eb0b             jmp 0x827                                
  081c  c45e06           les bx, ptr [bp + 6]                     
  081f  268b4702         mov ax, word ptr es:[bx + 2]             
  0823  2b067436         sub ax, word ptr [0x3674]                
  0827  c45e06           les bx, ptr [bp + 6]                     
  082a  26894702         mov word ptr es:[bx + 2], ax             
  082e  c45e06           les bx, ptr [bp + 6]                     
  0831  a17036           mov ax, word ptr [0x3670]                
  0834  26014704         add word ptr es:[bx + 4], ax             
  0838  c45e06           les bx, ptr [bp + 6]                     
  083b  a17436           mov ax, word ptr [0x3674]                
  083e  26014706         add word ptr es:[bx + 6], ax             
  0842  ff067635         inc word ptr [0x3576]                    
  0846  ff7608           push word ptr [bp + 8]                   
  0849  ff7606           push word ptr [bp + 6]                   
  084c  90               nop                                      
  084d  0e               push cs                                  
  084e  e86000           call 0x8b1                               
  0851  83c404           add sp, 4                                
  0854  0bc0             or ax, ax                                
  0856  740a             je 0x862                                 
  0858  c7067a350100     mov word ptr [0x357a], 1                 
  085e  0e               push cs                                  
  085f  e843ff           call 0x7a5                               
  0862  c70678350100     mov word ptr [0x3578], 1                 
  0868  5d               pop bp                                   
  0869  cb               retf                                     

res_12bf_086a:  ; ENTRY
  086a  ff0e7635         dec word ptr [0x3576]                    
  086e  7f17             jg 0x887                                 
  0870  c70678350000     mov word ptr [0x3578], 0                 
  0876  833e7a3500       cmp word ptr [0x357a], 0                 
  087b  7404             je 0x881                                 
  087d  0e               push cs                                  
  087e  e8d6fe           call 0x757                               
  0881  c7067a350000     mov word ptr [0x357a], 0                 
  0887  cb               retf                                     
  0888  55               push bp                                  
  0889  8bec             mov bp, sp                               
  088b  833e743500       cmp word ptr [0x3574], 0                 
  0890  741d             je 0x8af                                 
  0892  ff7608           push word ptr [bp + 8]                   
  0895  ff7606           push word ptr [bp + 6]                   
  0898  90               nop                                      
  0899  0e               push cs                                  
  089a  e81400           call 0x8b1                               
  089d  83c404           add sp, 4                                
  08a0  0bc0             or ax, ax                                
  08a2  740b             je 0x8af                                 
  08a4  833e703500       cmp word ptr [0x3570], 0                 
  08a9  7404             je 0x8af                                 
  08ab  0e               push cs                                  
  08ac  e8f6fe           call 0x7a5                               
  08af  5d               pop bp                                   
  08b0  cb               retf                                     

res_12bf_08b1:  ; ENTRY
  08b1  55               push bp                                  
  08b2  8bec             mov bp, sp                               
  08b4  56               push si                                  
  08b5  c45e06           les bx, ptr [bp + 6]                     
  08b8  268b4702         mov ax, word ptr es:[bx + 2]             
  08bc  3b066a35         cmp ax, word ptr [0x356a]                
  08c0  7f3a             jg 0x8fc                                 
  08c2  c45e06           les bx, ptr [bp + 6]                     
  08c5  268b4702         mov ax, word ptr es:[bx + 2]             
  08c9  c45e06           les bx, ptr [bp + 6]                     
  08cc  26034706         add ax, word ptr es:[bx + 6]             
  08d0  3b066a35         cmp ax, word ptr [0x356a]                
  08d4  7e26             jle 0x8fc                                
  08d6  c45e06           les bx, ptr [bp + 6]                     
  08d9  268b07           mov ax, word ptr es:[bx]                 
  08dc  3b066835         cmp ax, word ptr [0x3568]                
  08e0  7f1a             jg 0x8fc                                 
  08e2  c45e06           les bx, ptr [bp + 6]                     
  08e5  06               push es                                  
  08e6  c47606           les si, ptr [bp + 6]                     
  08e9  268b04           mov ax, word ptr es:[si]                 
  08ec  07               pop es                                   
  08ed  26034704         add ax, word ptr es:[bx + 4]             
  08f1  3b066835         cmp ax, word ptr [0x3568]                
  08f5  7e05             jle 0x8fc                                
  08f7  b80100           mov ax, 1                                
  08fa  eb02             jmp 0x8fe                                
  08fc  33c0             xor ax, ax                               
  08fe  eb00             jmp 0x900                                
  0900  5e               pop si                                   
  0901  5d               pop bp                                   
  0902  cb               retf                                     
  0903  55               push bp                                  
  0904  8bec             mov bp, sp                               
  0906  c45e06           les bx, ptr [bp + 6]                     
  0909  268b07           mov ax, word ptr es:[bx]                 
  090c  3b066a35         cmp ax, word ptr [0x356a]                
  0910  7f2c             jg 0x93e                                 
  0912  c45e06           les bx, ptr [bp + 6]                     
  0915  268b4704         mov ax, word ptr es:[bx + 4]             
  0919  3b066a35         cmp ax, word ptr [0x356a]                
  091d  7e1f             jle 0x93e                                
  091f  c45e06           les bx, ptr [bp + 6]                     
  0922  268b4702         mov ax, word ptr es:[bx + 2]             
  0926  3b066835         cmp ax, word ptr [0x3568]                
  092a  7f12             jg 0x93e                                 
  092c  c45e06           les bx, ptr [bp + 6]                     
  092f  268b4706         mov ax, word ptr es:[bx + 6]             
  0933  3b066835         cmp ax, word ptr [0x3568]                
  0937  7e05             jle 0x93e                                
  0939  b80100           mov ax, 1                                
  093c  eb02             jmp 0x940                                
  093e  33c0             xor ax, ax                               
  0940  eb00             jmp 0x942                                
  0942  5d               pop bp                                   
  0943  cb               retf                                     

res_12bf_0944:  ; ENTRY
  0944  c8040000         enter 4, 0                               
  0948  833e743500       cmp word ptr [0x3574], 0                 
  094d  7417             je 0x966                                 
  094f  16               push ss                                  
  0950  8d46fc           lea ax, [bp - 4]                         
  0953  50               push ax                                  
  0954  16               push ss                                  
  0955  8d46fe           lea ax, [bp - 2]                         
  0958  50               push ax                                  
  0959  9a0e00c00e       lcall 0xec0, 0xe                         -> 0ec0:000e
  095e  83c408           add sp, 8                                
  0961  250700           and ax, 7                                
  0964  eb02             jmp 0x968                                
  0966  33c0             xor ax, ax                               
  0968  eb00             jmp 0x96a                                
  096a  c9               leave                                    
  096b  cb               retf                                     
  096c  c8040000         enter 4, 0                               
  0970  66c746fccc000000 mov dword ptr [bp - 4], 0xcc             
  0978  c45efc           les bx, ptr [bp - 4]                     
  097b  6626833f00       cmp dword ptr es:[bx], 0                 
  0980  7405             je 0x987                                 
  0982  b80100           mov ax, 1                                
  0985  eb02             jmp 0x989                                
  0987  33c0             xor ax, ax                               
  0989  eb00             jmp 0x98b                                
  098b  c9               leave                                    
  098c  cb               retf                                     

res_12bf_098d:  ; ENTRY
  098d  c8020000         enter 2, 0                               
  0991  56               push si                                  
  0992  57               push di                                  
  0993  8b7e06           mov di, word ptr [bp + 6]                
  0996  2b3e1a6f         sub di, word ptr [0x6f1a]                
  099a  a1186f           mov ax, word ptr [0x6f18]                
  099d  294608           sub word ptr [bp + 8], ax                
  09a0  8b16b935         mov dx, word ptr [0x35b9]                
  09a4  83c208           add dx, 8                                
  09a7  8bc7             mov ax, di                               
  09a9  250700           and ax, 7                                
  09ac  f7ea             imul dx                                  
  09ae  8946fe           mov word ptr [bp - 2], ax                
  09b1  66833e3d3600     cmp dword ptr [0x363d], 0                
  09b7  7438             je 0x9f1                                 
  09b9  f70668360a00     test word ptr [0x3668], 0xa              
  09bf  7530             jne 0x9f1                                
  09c1  33f6             xor si, si                               
  09c3  eb23             jmp 0x9e8                                
  09c5  8bde             mov bx, si                               
  09c7  c1e302           shl bx, 2                                
  09ca  ffb73f36         push word ptr [bx + 0x363f]              
  09ce  ffb73d36         push word ptr [bx + 0x363d]              
  09d2  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  09d7  83c404           add sp, 4                                
  09da  8bde             mov bx, si                               
  09dc  c1e302           shl bx, 2                                
  09df  89974f36         mov word ptr [bx + 0x364f], dx           
  09e3  89874d36         mov word ptr [bx + 0x364d], ax           
  09e7  46               inc si                                   
  09e8  a06736           mov al, byte ptr [0x3667]                
  09eb  b400             mov ah, 0                                
  09ed  3bc6             cmp ax, si                               
  09ef  7fd4             jg 0x9c5                                 
  09f1  6a00             push 0                                   
  09f3  ff76fe           push word ptr [bp - 2]                   
  09f6  1e               push ds                                  
  09f7  683336           push 0x3633                              
  09fa  ff7608           push word ptr [bp + 8]                   
  09fd  8bc7             mov ax, di                               
  09ff  25f8ff           and ax, 0xfff8                           
  0a02  50               push ax                                  
  0a03  1e               push ds                                  
  0a04  682a34           push 0x342a                              
  0a07  ff367436         push word ptr [0x3674]                   
  0a0b  a17036           mov ax, word ptr [0x3670]                
  0a0e  050f00           add ax, 0xf                              
  0a11  25f0ff           and ax, 0xfff0                           
  0a14  50               push ax                                  
  0a15  6a00             push 0                                   
  0a17  ff76fe           push word ptr [bp - 2]                   
  0a1a  1e               push ds                                  
  0a1b  68bd35           push 0x35bd                              
  0a1e  ff1ec869         lcall [0x69c8]                           
  0a22  83c41c           add sp, 0x1c                             
  0a25  5f               pop di                                   
  0a26  5e               pop si                                   
  0a27  c9               leave                                    
  0a28  cb               retf                                     

res_12bf_0a29:  ; ENTRY
  0a29  1e               push ds                                  
  0a2a  687e35           push 0x357e                              
  0a2d  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  0a32  83c404           add sp, 4                                
  0a35  cb               retf                                     
  0a36  55               push bp                                  
  0a37  8bec             mov bp, sp                               
  0a39  56               push si                                  
  0a3a  57               push di                                  
  0a3b  8b760a           mov si, word ptr [bp + 0xa]              
  0a3e  8b7e0c           mov di, word ptr [bp + 0xc]              
  0a41  66837e0600       cmp dword ptr [bp + 6], 0                
  0a46  7413             je 0xa5b                                 
  0a48  ff7608           push word ptr [bp + 8]                   
  0a4b  ff7606           push word ptr [bp + 6]                   
  0a4e  0e               push cs                                  
  0a4f  e85ffe           call 0x8b1                               
  0a52  83c404           add sp, 4                                
  0a55  0bc0             or ax, ax                                
  0a57  7402             je 0xa5b                                 
  0a59  eb5e             jmp 0xab9                                
  0a5b  1e               push ds                                  
  0a5c  686a35           push 0x356a                              
  0a5f  1e               push ds                                  
  0a60  686835           push 0x3568                              
  0a63  90               nop                                      
  0a64  0e               push cs                                  
  0a65  e85500           call 0xabd                               
  0a68  83c408           add sp, 8                                
  0a6b  c41ee734         les bx, ptr [0x34e7]                     
  0a6f  8bc6             mov ax, si                               
  0a71  03067a36         add ax, word ptr [0x367a]                
  0a75  26394704         cmp word ptr es:[bx + 4], ax             
  0a79  7d0e             jge 0xa89                                
  0a7b  c41ee734         les bx, ptr [0x34e7]                     
  0a7f  268b4704         mov ax, word ptr es:[bx + 4]             
  0a83  2b067a36         sub ax, word ptr [0x367a]                
  0a87  8bf0             mov si, ax                               
  0a89  c41ee734         les bx, ptr [0x34e7]                     
  0a8d  8bc7             mov ax, di                               
  0a8f  03067c36         add ax, word ptr [0x367c]                
  0a93  26394706         cmp word ptr es:[bx + 6], ax             
  0a97  7d0e             jge 0xaa7                                
  0a99  c41ee734         les bx, ptr [0x34e7]                     
  0a9d  268b4706         mov ax, word ptr es:[bx + 6]             
  0aa1  2b067c36         sub ax, word ptr [0x367c]                
  0aa5  8bf8             mov di, ax                               
  0aa7  0e               push cs                                  
  0aa8  e8fafc           call 0x7a5                               
  0aab  57               push di                                  
  0aac  56               push si                                  
  0aad  9a4600c00e       lcall 0xec0, 0x46                        -> 0ec0:0046
  0ab2  83c404           add sp, 4                                
  0ab5  0e               push cs                                  
  0ab6  e89efc           call 0x757                               
  0ab9  5f               pop di                                   
  0aba  5e               pop si                                   
  0abb  5d               pop bp                                   
  0abc  cb               retf                                     

res_12bf_0abd:  ; ENTRY
  0abd  55               push bp                                  
  0abe  8bec             mov bp, sp                               
  0ac0  c45e06           les bx, ptr [bp + 6]                     
  0ac3  a16835           mov ax, word ptr [0x3568]                
  0ac6  268907           mov word ptr es:[bx], ax                 
  0ac9  c45e0a           les bx, ptr [bp + 0xa]                   
  0acc  a16a35           mov ax, word ptr [0x356a]                
  0acf  268907           mov word ptr es:[bx], ax                 
  0ad2  5d               pop bp                                   
  0ad3  cb               retf                                     
  0ad4  55               push bp                                  
  0ad5  8bec             mov bp, sp                               
  0ad7  c45e06           les bx, ptr [bp + 6]                     
  0ada  a16835           mov ax, word ptr [0x3568]                
  0add  268907           mov word ptr es:[bx], ax                 
  0ae0  c45e06           les bx, ptr [bp + 6]                     
  0ae3  a16a35           mov ax, word ptr [0x356a]                
  0ae6  26894702         mov word ptr es:[bx + 2], ax             
  0aea  8b5608           mov dx, word ptr [bp + 8]                
  0aed  8b4606           mov ax, word ptr [bp + 6]                
  0af0  eb00             jmp 0xaf2                                
  0af2  5d               pop bp                                   
  0af3  cb               retf                                     

res_12bf_0af4:  ; ENTRY
  0af4  55               push bp                                  
  0af5  8bec             mov bp, sp                               
  0af7  c45e06           les bx, ptr [bp + 6]                     
  0afa  a16835           mov ax, word ptr [0x3568]                
  0afd  268907           mov word ptr es:[bx], ax                 
  0b00  c45e06           les bx, ptr [bp + 6]                     
  0b03  a16a35           mov ax, word ptr [0x356a]                
  0b06  26894702         mov word ptr es:[bx + 2], ax             
  0b0a  5d               pop bp                                   
  0b0b  cb               retf                                     

res_12bf_0b0c:  ; ENTRY
  0b0c  55               push bp                                  
  0b0d  8bec             mov bp, sp                               
  0b0f  9a5600c00e       lcall 0xec0, 0x56                        -> 0ec0:0056
  0b14  c45e06           les bx, ptr [bp + 6]                     
  0b17  a16435           mov ax, word ptr [0x3564]                
  0b1a  268907           mov word ptr es:[bx], ax                 
  0b1d  c45e0a           les bx, ptr [bp + 0xa]                   
  0b20  a16635           mov ax, word ptr [0x3566]                
  0b23  268907           mov word ptr es:[bx], ax                 
  0b26  eb00             jmp 0xb28                                
  0b28  5d               pop bp                                   
  0b29  cb               retf                                     

res_12bf_0b2a:  ; ENTRY
  0b2a  8cda             mov dx, ds                               
  0b2c  b87636           mov ax, 0x3676                           
  0b2f  eb00             jmp 0xb31                                
  0b31  cb               retf                                     
  0b32  55               push bp                                  
