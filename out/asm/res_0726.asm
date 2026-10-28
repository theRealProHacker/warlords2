; res_0726 file_off 0x9260

res_0726_0009:  ; ENTRY
  0009  55               push bp                                  
  000a  8bec             mov bp, sp                               
  000c  83ec16           sub sp, 0x16                             
  000f  56               push si                                  
  0010  57               push di                                  
  0011  c746f20000       mov word ptr [bp - 0xe], 0               
  0016  833e6c1600       cmp word ptr [0x166c], 0                 
  001b  7405             je 0x22                                  
  001d  33c0             xor ax, ax                               
  001f  e96d04           jmp 0x48f                                
  0022  837e0600         cmp word ptr [bp + 6], 0                 
  0026  7408             je 0x30                                  
  0028  c7067a110000     mov word ptr [0x117a], 0                 
  002e  eb5c             jmp 0x8c                                 
  0030  9a4409bf12       lcall 0x12bf, 0x944                      -> 12bf:0944
  0035  8bf8             mov di, ax                               
  0037  0bc0             or ax, ax                                
  0039  7551             jne 0x8c                                 
  003b  833e741100       cmp word ptr [0x1174], 0                 
  0040  740b             je 0x4d                                  
  0042  c70674110000     mov word ptr [0x1174], 0                 
  0048  9a25006c30       lcall 0x306c, 0x25                       -> ovl46:11cf
  004d  833e761100       cmp word ptr [0x1176], 0                 
  0052  7406             je 0x5a                                  
  0054  c70676110000     mov word ptr [0x1176], 0                 
  005a  833e721100       cmp word ptr [0x1172], 0                 
  005f  7423             je 0x84                                  
  0061  c70672110000     mov word ptr [0x1172], 0                 
  0067  a17811           mov ax, word ptr [0x1178]                
  006a  ff067811         inc word ptr [0x1178]                    
  006e  3d0600           cmp ax, 6                                
  0071  7e11             jle 0x84                                 
  0073  666aff           push -1                                  
  0076  9a2f00d730       lcall 0x30d7, 0x2f                       -> ovl61:0b3b
  007b  83c404           add sp, 4                                
  007e  c70678110700     mov word ptr [0x1178], 7                 
  0084  c7067a110000     mov word ptr [0x117a], 0                 
  008a  eb91             jmp 0x1d                                 
  008c  833e741100       cmp word ptr [0x1174], 0                 
  0091  7402             je 0x95                                  
  0093  eb88             jmp 0x1d                                 
  0095  833e721100       cmp word ptr [0x1172], 0                 
  009a  7434             je 0xd0                                  
  009c  a17811           mov ax, word ptr [0x1178]                
  009f  ff067811         inc word ptr [0x1178]                    
  00a3  3d0600           cmp ax, 6                                
  00a6  7f03             jg 0xab                                  
  00a8  e972ff           jmp 0x1d                                 
  00ab  16               push ss                                  
  00ac  8d46ee           lea ax, [bp - 0x12]                      
  00af  50               push ax                                  
  00b0  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  00b5  83c404           add sp, 4                                
  00b8  66ff76ee         push dword ptr [bp - 0x12]               
  00bc  9a2f00d730       lcall 0x30d7, 0x2f                       -> ovl61:0b3b
  00c1  83c404           add sp, 4                                
  00c4  c70678110700     mov word ptr [0x1178], 7                 
  00ca  e950ff           jmp 0x1d                                 
  00cd  e94dff           jmp 0x1d                                 
  00d0  833e761100       cmp word ptr [0x1176], 0                 
  00d5  7419             je 0xf0                                  
  00d7  16               push ss                                  
  00d8  8d46ee           lea ax, [bp - 0x12]                      
  00db  50               push ax                                  
  00dc  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  00e1  83c404           add sp, 4                                
  00e4  66ff76ee         push dword ptr [bp - 0x12]               
  00e8  9a2a00d730       lcall 0x30d7, 0x2a                       -> ovl61:0e04
  00ed  e91203           jmp 0x402                                
  00f0  c41e404c         les bx, ptr [0x4c40]                     
  00f4  26c45f0c         les bx, ptr es:[bx + 0xc]                
  00f8  268b37           mov si, word ptr es:[bx]                 
  00fb  e97a03           jmp 0x478                                
  00fe  c41e404c         les bx, ptr [0x4c40]                     
  0102  268b4706         mov ax, word ptr es:[bx + 6]             
  0106  268b5704         mov dx, word ptr es:[bx + 4]             
  010a  8bde             mov bx, si                               
  010c  6bdb0e           imul bx, bx, 0xe                         
  010f  03d3             add dx, bx                               
  0111  8946fe           mov word ptr [bp - 2], ax                
  0114  8ec0             mov es, ax                               
  0116  8956fc           mov word ptr [bp - 4], dx                
  0119  8bda             mov bx, dx                               
  011b  26837f0201       cmp word ptr es:[bx + 2], 1              
  0120  7403             je 0x125                                 
  0122  e95303           jmp 0x478                                
  0125  c45efc           les bx, ptr [bp - 4]                     
  0128  26ff770a         push word ptr es:[bx + 0xa]              
  012c  26ff7708         push word ptr es:[bx + 8]                
  0130  26ff7706         push word ptr es:[bx + 6]                
  0134  26ff7704         push word ptr es:[bx + 4]                
  0138  16               push ss                                  
  0139  8d46f4           lea ax, [bp - 0xc]                       
  013c  50               push ax                                  
  013d  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0142  83c40c           add sp, 0xc                              
  0145  c45efc           les bx, ptr [bp - 4]                     
  0148  26837f0c00       cmp word ptr es:[bx + 0xc], 0            
  014d  750d             jne 0x15c                                
  014f  16               push ss                                  
  0150  8d46f4           lea ax, [bp - 0xc]                       
  0153  50               push ax                                  
  0154  9a3701b014       lcall 0x14b0, 0x137                      -> 14b0:0137
  0159  83c404           add sp, 4                                
  015c  16               push ss                                  
  015d  8d46f4           lea ax, [bp - 0xc]                       
  0160  50               push ax                                  
  0161  9ab108bf12       lcall 0x12bf, 0x8b1                      -> 12bf:08b1
  0166  83c404           add sp, 4                                
  0169  0bc0             or ax, ax                                
  016b  7503             jne 0x170                                
  016d  e90803           jmp 0x478                                
  0170  c45efc           les bx, ptr [bp - 4]                     
  0173  268b1f           mov bx, word ptr es:[bx]                 
  0176  4b               dec bx                                   
  0177  83fb0e           cmp bx, 0xe                              
  017a  7603             jbe 0x17f                                
  017c  e9f902           jmp 0x478                                
  017f  d1e3             shl bx, 1                                
  0181  2effa79304       jmp word ptr cs:[bx + 0x493]             
res_0726_0186:  ; case
  0186  16               push ss                                  
  0187  8d46ee           lea ax, [bp - 0x12]                      
  018a  50               push ax                                  
  018b  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  0190  83c404           add sp, 4                                
  0193  8b46ee           mov ax, word ptr [bp - 0x12]             
  0196  0570fe           add ax, 0xfe70                           
  0199  99               cdq                                      
  019a  2bc2             sub ax, dx                               
  019c  8bf0             mov si, ax                               
  019e  d1fe             sar si, 1                                
  01a0  8b46f0           mov ax, word ptr [bp - 0x10]             
  01a3  05e2ff           add ax, 0xffe2                           
  01a6  99               cdq                                      
  01a7  2bc2             sub ax, dx                               
  01a9  d1f8             sar ax, 1                                
  01ab  8946ec           mov word ptr [bp - 0x14], ax             
  01ae  83ff01           cmp di, 1                                
  01b1  752b             jne 0x1de                                
  01b3  33c0             xor ax, ax                               
  01b5  8ec0             mov es, ax                               
  01b7  26f606170408     test byte ptr es:[0x417], 8              
  01bd  740b             je 0x1ca                                 
  01bf  6a01             push 1                                   
  01c1  50               push ax                                  
  01c2  9a07008c0c       lcall 0xc8c, 7                           -> 0c8c:0007
  01c7  e93802           jmp 0x402                                
  01ca  ff76ec           push word ptr [bp - 0x14]                
  01cd  56               push si                                  
  01ce  9a25000831       lcall 0x3108, 0x25                       -> ovl65:0227
  01d3  83c404           add sp, 4                                
  01d6  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  01db  e93ffe           jmp 0x1d                                 
  01de  66680e000100     push 0x1000e                             
  01e4  ff76ec           push word ptr [bp - 0x14]                
  01e7  56               push si                                  
  01e8  9a5c00e830       lcall 0x30e8, 0x5c                       -> ovl62:04fa
  01ed  83c408           add sp, 8                                
  01f0  8946ea           mov word ptr [bp - 0x16], ax             
  01f3  ff76ec           push word ptr [bp - 0x14]                
  01f6  56               push si                                  
  01f7  6a01             push 1                                   
  01f9  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  01fe  83c406           add sp, 6                                
  0201  0bc0             or ax, ax                                
  0203  7503             jne 0x208                                
  0205  e915fe           jmp 0x1d                                 
  0208  6a00             push 0                                   
  020a  66ff76ee         push dword ptr [bp - 0x12]               
  020e  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  0213  83c406           add sp, 6                                
  0216  ff76ea           push word ptr [bp - 0x16]                
  0219  9a2f006c30       lcall 0x306c, 0x2f                       -> ovl46:0c73
  021e  59               pop cx                                   
  021f  e94202           jmp 0x464                                
  0222  e9f8fd           jmp 0x1d                                 
res_0726_0225:  ; case
  0225  16               push ss                                  
  0226  8d46ee           lea ax, [bp - 0x12]                      
  0229  50               push ax                                  
  022a  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  022f  83c404           add sp, 4                                
  0232  8b46ee           mov ax, word ptr [bp - 0x12]             
  0235  05f0ff           add ax, 0xfff0                           
  0238  bb2800           mov bx, 0x28                             
  023b  99               cdq                                      
  023c  f7fb             idiv bx                                  
  023e  ba042c           mov dx, 0x2c04                           
  0241  8ec2             mov es, dx                               
  0243  268b367701       mov si, word ptr es:[0x177]              
  0248  03f0             add si, ax                               
  024a  8b46f0           mov ax, word ptr [bp - 0x10]             
  024d  05e2ff           add ax, 0xffe2                           
  0250  99               cdq                                      
  0251  f7fb             idiv bx                                  
  0253  ba042c           mov dx, 0x2c04                           
  0256  8ec2             mov es, dx                               
  0258  268b167501       mov dx, word ptr es:[0x175]              
  025d  03d0             add dx, ax                               
  025f  8956ec           mov word ptr [bp - 0x14], dx             
  0262  57               push di                                  
  0263  52               push dx                                  
  0264  56               push si                                  
  0265  9a20006c30       lcall 0x306c, 0x20                       -> ovl46:0000
  026a  e9d100           jmp 0x33e                                
res_0726_026d:  ; case
  026d  16               push ss                                  
  026e  8d46ee           lea ax, [bp - 0x12]                      
  0271  50               push ax                                  
  0272  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  0277  83c404           add sp, 4                                
  027a  83ff01           cmp di, 1                                
  027d  7515             jne 0x294                                
  027f  66ff76ee         push dword ptr [bp - 0x12]               
  0283  9a2a00d730       lcall 0x30d7, 0x2a                       -> ovl61:0e04
  0288  83c404           add sp, 4                                
  028b  c70676110100     mov word ptr [0x1176], 1                 
  0291  e989fd           jmp 0x1d                                 
  0294  6a00             push 0                                   
  0296  66ff76ee         push dword ptr [bp - 0x12]               
  029a  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  029f  83c406           add sp, 6                                
  02a2  1e               push ds                                  
  02a3  688c11           push 0x118c                               ; "Move mouse to drag the screen"
  02a6  1e               push ds                                  
  02a7  687c11           push 0x117c                               ; "- Drag Screen -"
  02aa  e9af01           jmp 0x45c                                
res_0726_02ad:  ; case
  02ad  16               push ss                                  
  02ae  8d46ee           lea ax, [bp - 0x12]                      
  02b1  50               push ax                                  
  02b2  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  02b7  83c404           add sp, 4                                
  02ba  83ff02           cmp di, 2                                
  02bd  7403             je 0x2c2                                 
  02bf  e95bfd           jmp 0x1d                                 
  02c2  8b46ee           mov ax, word ptr [bp - 0x12]             
  02c5  05f0ff           add ax, 0xfff0                           
  02c8  bb5a00           mov bx, 0x5a                             
  02cb  99               cdq                                      
  02cc  f7fb             idiv bx                                  
  02ce  8bf0             mov si, ax                               
  02d0  50               push ax                                  
  02d1  66ff76ee         push dword ptr [bp - 0x12]               
  02d5  9a48000c31       lcall 0x310c, 0x48                       -> ovl66:0ad9
  02da  eb62             jmp 0x33e                                
  02dc  e93efd           jmp 0x1d                                 
res_0726_02df:  ; case
  02df  6a01             push 1                                   
  02e1  9af0007213       lcall 0x1372, 0xf0                       -> 1372:00f0
  02e6  59               pop cx                                   
  02e7  e9a501           jmp 0x48f                                
res_0726_02ea:  ; case
  02ea  83ff02           cmp di, 2                                
  02ed  7403             je 0x2f2                                 
  02ef  e92bfd           jmp 0x1d                                 
  02f2  16               push ss                                  
  02f3  8d46ee           lea ax, [bp - 0x12]                      
  02f6  50               push ax                                  
  02f7  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  02fc  83c404           add sp, 4                                
  02ff  66ff76ee         push dword ptr [bp - 0x12]               
  0303  9a5c006430       lcall 0x3064, 0x5c                       -> ovl45:1c35
  0308  e9f700           jmp 0x402                                
  030b  e90ffd           jmp 0x1d                                 
res_0726_030e:  ; case
  030e  16               push ss                                  
  030f  8d46ee           lea ax, [bp - 0x12]                      
  0312  50               push ax                                  
  0313  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  0318  83c404           add sp, 4                                
  031b  8b46ee           mov ax, word ptr [bp - 0x12]             
  031e  05b0ff           add ax, 0xffb0                           
  0321  99               cdq                                      
  0322  2bc2             sub ax, dx                               
  0324  8bf0             mov si, ax                               
  0326  d1fe             sar si, 1                                
  0328  8b46f0           mov ax, word ptr [bp - 0x10]             
  032b  05c4ff           add ax, 0xffc4                           
  032e  99               cdq                                      
  032f  2bc2             sub ax, dx                               
  0331  d1f8             sar ax, 1                                
  0333  8946ec           mov word ptr [bp - 0x14], ax             
  0336  57               push di                                  
  0337  50               push ax                                  
  0338  56               push si                                  
  0339  9a43006430       lcall 0x3064, 0x43                       -> ovl45:1afa
  033e  83c406           add sp, 6                                
  0341  e9d9fc           jmp 0x1d                                 
res_0726_0344:  ; case
  0344  16               push ss                                  
  0345  8d46ee           lea ax, [bp - 0x12]                      
  0348  50               push ax                                  
  0349  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  034e  83c404           add sp, 4                                
  0351  83ff02           cmp di, 2                                
  0354  7519             jne 0x36f                                
  0356  6a00             push 0                                   
  0358  66ff76ee         push dword ptr [bp - 0x12]               
  035c  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  0361  83c406           add sp, 6                                
  0364  1e               push ds                                  
  0365  68b911           push 0x11b9                               ; "Click to see an area of map"
  0368  1e               push ds                                  
  0369  68aa11           push 0x11aa                               ; "- Reveal Map -"
  036c  e9ed00           jmp 0x45c                                
  036f  8b46ee           mov ax, word ptr [bp - 0x12]             
  0372  05b0ff           add ax, 0xffb0                           
  0375  99               cdq                                      
  0376  2bc2             sub ax, dx                               
  0378  8bf0             mov si, ax                               
  037a  d1fe             sar si, 1                                
  037c  8b46f0           mov ax, word ptr [bp - 0x10]             
  037f  05c4ff           add ax, 0xffc4                           
  0382  99               cdq                                      
  0383  2bc2             sub ax, dx                               
  0385  d1f8             sar ax, 1                                
  0387  8946ec           mov word ptr [bp - 0x14], ax             
  038a  50               push ax                                  
  038b  56               push si                                  
  038c  9a48001430       lcall 0x3014, 0x48                       -> ovl34:0cd6
  0391  eb6f             jmp 0x402                                
res_0726_0393:  ; case
  0393  16               push ss                                  
  0394  8d46ee           lea ax, [bp - 0x12]                      
  0397  50               push ax                                  
  0398  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  039d  83c404           add sp, 4                                
  03a0  83ff02           cmp di, 2                                
  03a3  7403             je 0x3a8                                 
  03a5  e975fc           jmp 0x1d                                 
  03a8  66ff76ee         push dword ptr [bp - 0x12]               
  03ac  9a57003b30       lcall 0x303b, 0x57                       -> ovl40:11dc
  03b1  eb4f             jmp 0x402                                
  03b3  e967fc           jmp 0x1d                                 
res_0726_03b6:  ; case
  03b6  16               push ss                                  
  03b7  8d46ee           lea ax, [bp - 0x12]                      
  03ba  50               push ax                                  
  03bb  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  03c0  83c404           add sp, 4                                
  03c3  83ff02           cmp di, 2                                
  03c6  7518             jne 0x3e0                                
  03c8  6a00             push 0                                   
  03ca  66ff76ee         push dword ptr [bp - 0x12]               
  03ce  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  03d3  83c406           add sp, 6                                
  03d6  1e               push ds                                  
  03d7  68e511           push 0x11e5                               ; "Click to select a hero"
  03da  1e               push ds                                  
  03db  68d511           push 0x11d5                               ; "- Select Hero -"
  03de  eb7c             jmp 0x45c                                
  03e0  8b46ee           mov ax, word ptr [bp - 0x12]             
  03e3  05b0ff           add ax, 0xffb0                           
  03e6  99               cdq                                      
  03e7  2bc2             sub ax, dx                               
  03e9  8bf0             mov si, ax                               
  03eb  d1fe             sar si, 1                                
  03ed  8b46f0           mov ax, word ptr [bp - 0x10]             
  03f0  05c4ff           add ax, 0xffc4                           
  03f3  99               cdq                                      
  03f4  2bc2             sub ax, dx                               
  03f6  d1f8             sar ax, 1                                
  03f8  8946ec           mov word ptr [bp - 0x14], ax             
  03fb  50               push ax                                  
  03fc  56               push si                                  
  03fd  9a3e003b30       lcall 0x303b, 0x3e                       -> ovl40:115e
  0402  83c404           add sp, 4                                
  0405  e915fc           jmp 0x1d                                 
res_0726_0408:  ; case
  0408  16               push ss                                  
  0409  8d46ee           lea ax, [bp - 0x12]                      
  040c  50               push ax                                  
  040d  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  0412  83c404           add sp, 4                                
  0415  83ff02           cmp di, 2                                
  0418  7553             jne 0x46d                                
  041a  6a00             push 0                                   
  041c  66ff76ee         push dword ptr [bp - 0x12]               
  0420  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  0425  83c406           add sp, 6                                
  0428  1e               push ds                                  
  0429  680c12           push 0x120c                               ; "Click to see that turn"
  042c  1e               push ds                                  
  042d  68fc11           push 0x11fc                               ; "- Select Turn -"
  0430  eb2a             jmp 0x45c                                
  0432  eb39             jmp 0x46d                                
res_0726_0434:  ; case
  0434  16               push ss                                  
  0435  8d46ee           lea ax, [bp - 0x12]                      
  0438  50               push ax                                  
  0439  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  043e  83c404           add sp, 4                                
  0441  83ff02           cmp di, 2                                
  0444  7527             jne 0x46d                                
  0446  6a00             push 0                                   
  0448  66ff76ee         push dword ptr [bp - 0x12]               
  044c  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  0451  83c406           add sp, 6                                
  0454  1e               push ds                                  
  0455  683312           push 0x1233                               ; "Click to change turn"
  0458  1e               push ds                                  
  0459  682312           push 0x1223                               ; "- Select Turn -"
  045c  9a34006c30       lcall 0x306c, 0x34                       -> ovl46:10e1
  0461  83c408           add sp, 8                                
  0464  c70674110100     mov word ptr [0x1174], 1                 
  046a  e9b0fb           jmp 0x1d                                 
  046d  6a00             push 0                                   
  046f  9a4d004230       lcall 0x3042, 0x4d                       -> ovl41:0908
  0474  59               pop cx                                   
  0475  e9a5fb           jmp 0x1d                                 
res_0726_0478:  ; case
  0478  8bc6             mov ax, si                               
  047a  4e               dec si                                   
  047b  0bc0             or ax, ax                                
  047d  7403             je 0x482                                 
  047f  e97cfc           jmp 0xfe                                 
  0482  837e0600         cmp word ptr [bp + 6], 0                 
  0486  7405             je 0x48d                                 
  0488  8b46f2           mov ax, word ptr [bp - 0xe]              
  048b  eb02             jmp 0x48f                                
  048d  33c0             xor ax, ax                               
  048f  5f               pop di                                   
  0490  5e               pop si                                   
  0491  c9               leave                                    
  0492  cb               retf                                     
  0493  86012502df027804 dw 0186,0225,02df,0478,0478,030e,0478,03b6,02ad,0408,0434,0393,026d,02ea,0344 jump table
  04b1  55               push bp                                  
