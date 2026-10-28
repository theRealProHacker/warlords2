; seg 0579  img 0x5790..0x62b0  file off 0x6390
  0579:0000  c8020000         enter 2, 0                               
  0579:0004  56               push si                                  
  0579:0005  57               push di                                  
  0579:0006  c746fe0000       mov word ptr [bp - 2], 0                 
  0579:000b  1e               push ds                                  
  0579:000c  689604           push 0x496                                ; "start\ding0.snd"
  0579:000f  9ae804070c       lcall 0xc07, 0x4e8                       -> 0c07:04e8 [reloc]
  0579:0014  83c404           add sp, 4                                
  0579:0017  8bf8             mov di, ax                               
  0579:0019  1e               push ds                                  
  0579:001a  68ad04           push 0x4ad                                ; "anim.xmi"
  0579:001d  1e               push ds                                  
  0579:001e  68a604           push 0x4a6                                ; "start\"
  0579:0021  9a2e03070c       lcall 0xc07, 0x32e                       -> 0c07:032e [reloc]
  0579:0026  83c408           add sp, 8                                
  0579:0029  6a00             push 0                                   
  0579:002b  6a00             push 0                                   
  0579:002d  9a1104070c       lcall 0xc07, 0x411                       -> 0c07:0411 [reloc]
  0579:0032  83c404           add sp, 4                                
  0579:0035  90               nop                                      
  0579:0036  0e               push cs                                  
  0579:0037  e8fe03           call 0x438                               -> 0579:0438
  0579:003a  6a02             push 2                                   
  0579:003c  9a03005105       lcall 0x551, 3                           -> 0551:0003 [reloc]
  0579:0041  59               pop cx                                   
  0579:0042  1e               push ds                                  
  0579:0043  68b704           push 0x4b7                                ; "start\ssg.pck"
  0579:0046  1e               push ds                                  
  0579:0047  68b604           push 0x4b6                               
  0579:004a  1e               push ds                                  
  0579:004b  689403           push 0x394                               
  0579:004e  9a01006606       lcall 0x666, 1                           -> 0666:0001 [reloc]
  0579:0053  83c40c           add sp, 0xc                              
  0579:0056  6a00             push 0                                   
  0579:0058  9a03005105       lcall 0x551, 3                           -> 0551:0003 [reloc]
  0579:005d  59               pop cx                                   
  0579:005e  1e               push ds                                  
  0579:005f  689403           push 0x394                               
  0579:0062  90               nop                                      
  0579:0063  0e               push cs                                  
  0579:0064  e89104           call 0x4f8                               -> 0579:04f8
  0579:0067  83c404           add sp, 4                                
  0579:006a  1e               push ds                                  
  0579:006b  689403           push 0x394                               
  0579:006e  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0579:0073  83c404           add sp, 4                                
  0579:0076  6a0a             push 0xa                                 
  0579:0078  90               nop                                      
  0579:0079  0e               push cs                                  
  0579:007a  e81704           call 0x494                               -> 0579:0494
  0579:007d  59               pop cx                                   
  0579:007e  1e               push ds                                  
  0579:007f  68c604           push 0x4c6                                ; "start\black.pck"
  0579:0082  1e               push ds                                  
  0579:0083  68c504           push 0x4c5                               
  0579:0086  1e               push ds                                  
  0579:0087  689403           push 0x394                               
  0579:008a  9a01006606       lcall 0x666, 1                           -> 0666:0001 [reloc]
  0579:008f  83c40c           add sp, 0xc                              
  0579:0092  1e               push ds                                  
  0579:0093  689403           push 0x394                               
  0579:0096  90               nop                                      
  0579:0097  0e               push cs                                  
  0579:0098  e85d04           call 0x4f8                               -> 0579:04f8
  0579:009b  83c404           add sp, 4                                
  0579:009e  1e               push ds                                  
  0579:009f  689403           push 0x394                               
  0579:00a2  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0579:00a7  83c404           add sp, 4                                
  0579:00aa  6a02             push 2                                   
  0579:00ac  9a03005105       lcall 0x551, 3                           -> 0551:0003 [reloc]
  0579:00b1  59               pop cx                                   
  0579:00b2  90               nop                                      
  0579:00b3  0e               push cs                                  
  0579:00b4  e88103           call 0x438                               -> 0579:0438
  0579:00b7  1e               push ds                                  
  0579:00b8  68d704           push 0x4d7                                ; "start\start.pck"
  0579:00bb  1e               push ds                                  
  0579:00bc  68d604           push 0x4d6                               
  0579:00bf  1e               push ds                                  
  0579:00c0  689403           push 0x394                               
  0579:00c3  9a01006606       lcall 0x666, 1                           -> 0666:0001 [reloc]
  0579:00c8  83c40c           add sp, 0xc                              
  0579:00cb  6a01             push 1                                   
  0579:00cd  9a03005105       lcall 0x551, 3                           -> 0551:0003 [reloc]
  0579:00d2  59               pop cx                                   
  0579:00d3  1e               push ds                                  
  0579:00d4  689403           push 0x394                               
  0579:00d7  90               nop                                      
  0579:00d8  0e               push cs                                  
  0579:00d9  e81c04           call 0x4f8                               -> 0579:04f8
  0579:00dc  83c404           add sp, 4                                
  0579:00df  1e               push ds                                  
  0579:00e0  689403           push 0x394                               
  0579:00e3  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0579:00e8  83c404           add sp, 4                                
  0579:00eb  6a14             push 0x14                                
  0579:00ed  90               nop                                      
  0579:00ee  0e               push cs                                  
  0579:00ef  e8a203           call 0x494                               -> 0579:0494
  0579:00f2  59               pop cx                                   
  0579:00f3  90               nop                                      
  0579:00f4  0e               push cs                                  
  0579:00f5  e84003           call 0x438                               -> 0579:0438
  0579:00f8  68f000           push 0xf0                                
  0579:00fb  68e001           push 0x1e0                               
  0579:00fe  1e               push ds                                  
  0579:00ff  681e03           push 0x31e                               
  0579:0102  9a7c023d08       lcall 0x83d, 0x27c                       -> 083d:027c [reloc]
  0579:0107  83c408           add sp, 8                                
  0579:010a  a12803           mov ax, word ptr [0x328]                 
  0579:010d  0b062a03         or ax, word ptr [0x32a]                  
  0579:0111  7438             je 0x14b                                 
  0579:0113  f70653030a00     test word ptr [0x353], 0xa               
  0579:0119  7530             jne 0x14b                                
  0579:011b  33f6             xor si, si                               
  0579:011d  eb23             jmp 0x142                                
  0579:011f  8bde             mov bx, si                               
  0579:0121  c1e302           shl bx, 2                                
  0579:0124  ffb72a03         push word ptr [bx + 0x32a]               
  0579:0128  ffb72803         push word ptr [bx + 0x328]               
  0579:012c  9a9406870c       lcall 0xc87, 0x694                       -> 0c87:0694 [reloc]
  0579:0131  83c404           add sp, 4                                
  0579:0134  8bde             mov bx, si                               
  0579:0136  c1e302           shl bx, 2                                
  0579:0139  89973a03         mov word ptr [bx + 0x33a], dx            
  0579:013d  89873803         mov word ptr [bx + 0x338], ax            
  0579:0141  46               inc si                                   
  0579:0142  a05203           mov al, byte ptr [0x352]                 
  0579:0145  b400             mov ah, 0                                
  0579:0147  3bc6             cmp ax, si                               
  0579:0149  7fd4             jg 0x11f                                 
  0579:014b  6a00             push 0                                   
  0579:014d  6a00             push 0                                   
  0579:014f  1e               push ds                                  
  0579:0150  681e03           push 0x31e                               
  0579:0153  68f000           push 0xf0                                
  0579:0156  68e001           push 0x1e0                               
  0579:0159  6a00             push 0                                   
  0579:015b  6a50             push 0x50                                
  0579:015d  1e               push ds                                  
  0579:015e  684c07           push 0x74c                               
  0579:0161  ff1ef615         lcall [0x15f6]                           
  0579:0165  83c414           add sp, 0x14                             
  0579:0168  a12803           mov ax, word ptr [0x328]                 
  0579:016b  0b062a03         or ax, word ptr [0x32a]                  
  0579:016f  742b             je 0x19c                                 
  0579:0171  f70653030a00     test word ptr [0x353], 0xa               
  0579:0177  7523             jne 0x19c                                
  0579:0179  33f6             xor si, si                               
  0579:017b  eb16             jmp 0x193                                
  0579:017d  8bde             mov bx, si                               
  0579:017f  c1e302           shl bx, 2                                
  0579:0182  ffb72a03         push word ptr [bx + 0x32a]               
  0579:0186  ffb72803         push word ptr [bx + 0x328]               
  0579:018a  9aa307870c       lcall 0xc87, 0x7a3                       -> 0c87:07a3 [reloc]
  0579:018f  83c404           add sp, 4                                
  0579:0192  46               inc si                                   
  0579:0193  a05203           mov al, byte ptr [0x352]                 
  0579:0196  b400             mov ah, 0                                
  0579:0198  3bc6             cmp ax, si                               
  0579:019a  7fe1             jg 0x17d                                 
  0579:019c  1e               push ds                                  
  0579:019d  685903           push 0x359                               
  0579:01a0  9a4d0a3d08       lcall 0x83d, 0xa4d                       -> 083d:0a4d [reloc]
  0579:01a5  83c404           add sp, 4                                
  0579:01a8  68d200           push 0xd2                                
  0579:01ab  68e001           push 0x1e0                               
  0579:01ae  1e               push ds                                  
  0579:01af  685903           push 0x359                               
  0579:01b2  9a7c023d08       lcall 0x83d, 0x27c                       -> 083d:027c [reloc]
  0579:01b7  83c408           add sp, 8                                
  0579:01ba  90               nop                                      
  0579:01bb  0e               push cs                                  
  0579:01bc  e87902           call 0x438                               -> 0579:0438
  0579:01bf  1e               push ds                                  
  0579:01c0  68e804           push 0x4e8                                ; "start\stext.pck"
  0579:01c3  1e               push ds                                  
  0579:01c4  68e704           push 0x4e7                               
  0579:01c7  1e               push ds                                  
  0579:01c8  689403           push 0x394                               
  0579:01cb  9a01006606       lcall 0x666, 1                           -> 0666:0001 [reloc]
  0579:01d0  83c40c           add sp, 0xc                              
  0579:01d3  6a0d             push 0xd                                 
  0579:01d5  1e               push ds                                  
  0579:01d6  68cf03           push 0x3cf                               
  0579:01d9  1e               push ds                                  
  0579:01da  689403           push 0x394                               
  0579:01dd  16               push ss                                  
  0579:01de  8d46fe           lea ax, [bp - 2]                         
  0579:01e1  50               push ax                                  
  0579:01e2  9ad000c30b       lcall 0xbc3, 0xd0                        -> 0bc3:00d0 [reloc]
  0579:01e7  83c40e           add sp, 0xe                              
  0579:01ea  be0600           mov si, 6                                
  0579:01ed  eb76             jmp 0x265                                
  0579:01ef  90               nop                                      
  0579:01f0  0e               push cs                                  
  0579:01f1  e84402           call 0x438                               -> 0579:0438
  0579:01f4  6a00             push 0                                   
  0579:01f6  6a00             push 0                                   
  0579:01f8  1e               push ds                                  
  0579:01f9  685903           push 0x359                               
  0579:01fc  56               push si                                  
  0579:01fd  68e001           push 0x1e0                               
  0579:0200  6a00             push 0                                   
  0579:0202  6a00             push 0                                   
  0579:0204  1e               push ds                                  
  0579:0205  681e03           push 0x31e                               
  0579:0208  ff1ef615         lcall [0x15f6]                           
  0579:020c  83c414           add sp, 0x14                             
  0579:020f  b8d200           mov ax, 0xd2                             
  0579:0212  2bc6             sub ax, si                               
  0579:0214  50               push ax                                  
  0579:0215  6a00             push 0                                   
  0579:0217  1e               push ds                                  
  0579:0218  68cf03           push 0x3cf                               
  0579:021b  6a00             push 0                                   
  0579:021d  6a00             push 0                                   
  0579:021f  1e               push ds                                  
  0579:0220  685903           push 0x359                               
  0579:0223  56               push si                                  
  0579:0224  68e001           push 0x1e0                               
  0579:0227  b8d200           mov ax, 0xd2                             
  0579:022a  2bc6             sub ax, si                               
  0579:022c  50               push ax                                  
  0579:022d  6a00             push 0                                   
  0579:022f  1e               push ds                                  
  0579:0230  689403           push 0x394                               
  0579:0233  ff1eea15         lcall [0x15ea]                           
  0579:0237  83c41c           add sp, 0x1c                             
  0579:023a  9a0a008206       lcall 0x682, 0xa                         -> 0682:000a [reloc]
  0579:023f  6a00             push 0                                   
  0579:0241  6a50             push 0x50                                
  0579:0243  1e               push ds                                  
  0579:0244  684c07           push 0x74c                               
  0579:0247  56               push si                                  
  0579:0248  68e001           push 0x1e0                               
  0579:024b  6a00             push 0                                   
  0579:024d  6a00             push 0                                   
  0579:024f  1e               push ds                                  
  0579:0250  685903           push 0x359                               
  0579:0253  ff1ef615         lcall [0x15f6]                           
  0579:0257  83c414           add sp, 0x14                             
  0579:025a  6a14             push 0x14                                
  0579:025c  9a222f0000       lcall 0, 0x2f22                          -> 0000:2f22 [reloc]
  0579:0261  59               pop cx                                   
  0579:0262  83c606           add si, 6                                
  0579:0265  81fed200         cmp si, 0xd2                             
  0579:0269  7e84             jle 0x1ef                                
  0579:026b  be0600           mov si, 6                                
  0579:026e  e99600           jmp 0x307                                
  0579:0271  90               nop                                      
  0579:0272  0e               push cs                                  
  0579:0273  e8c201           call 0x438                               -> 0579:0438
  0579:0276  6a00             push 0                                   
  0579:0278  6a00             push 0                                   
  0579:027a  1e               push ds                                  
  0579:027b  685903           push 0x359                               
  0579:027e  68d200           push 0xd2                                
  0579:0281  68e001           push 0x1e0                               
  0579:0284  56               push si                                  
  0579:0285  6a00             push 0                                   
  0579:0287  1e               push ds                                  
  0579:0288  681e03           push 0x31e                               
  0579:028b  ff1ef615         lcall [0x15f6]                           
  0579:028f  83c414           add sp, 0x14                             
  0579:0292  6a00             push 0                                   
  0579:0294  6a00             push 0                                   
  0579:0296  1e               push ds                                  
  0579:0297  68cf03           push 0x3cf                               
  0579:029a  6a00             push 0                                   
  0579:029c  6a00             push 0                                   
  0579:029e  1e               push ds                                  
  0579:029f  685903           push 0x359                               
  0579:02a2  68d200           push 0xd2                                
  0579:02a5  68e001           push 0x1e0                               
  0579:02a8  6a00             push 0                                   
  0579:02aa  6a00             push 0                                   
  0579:02ac  1e               push ds                                  
  0579:02ad  689403           push 0x394                               
  0579:02b0  ff1eea15         lcall [0x15ea]                           
  0579:02b4  83c41c           add sp, 0x1c                             
  0579:02b7  9a0a008206       lcall 0x682, 0xa                         -> 0682:000a [reloc]
  0579:02bc  8bc6             mov ax, si                               
  0579:02be  05faff           add ax, 0xfffa                           
  0579:02c1  50               push ax                                  
  0579:02c2  6a50             push 0x50                                
  0579:02c4  1e               push ds                                  
  0579:02c5  684c07           push 0x74c                               
  0579:02c8  6a06             push 6                                   
  0579:02ca  68e001           push 0x1e0                               
  0579:02cd  8bc6             mov ax, si                               
  0579:02cf  05faff           add ax, 0xfffa                           
  0579:02d2  50               push ax                                  
  0579:02d3  6a00             push 0                                   
  0579:02d5  1e               push ds                                  
  0579:02d6  681e03           push 0x31e                               
  0579:02d9  ff1ef615         lcall [0x15f6]                           
  0579:02dd  83c414           add sp, 0x14                             
  0579:02e0  56               push si                                  
  0579:02e1  6a50             push 0x50                                
  0579:02e3  1e               push ds                                  
  0579:02e4  684c07           push 0x74c                               
  0579:02e7  68d200           push 0xd2                                
  0579:02ea  68e001           push 0x1e0                               
  0579:02ed  6a00             push 0                                   
  0579:02ef  6a00             push 0                                   
  0579:02f1  1e               push ds                                  
  0579:02f2  685903           push 0x359                               
  0579:02f5  ff1ef615         lcall [0x15f6]                           
  0579:02f9  83c414           add sp, 0x14                             
  0579:02fc  6a14             push 0x14                                
  0579:02fe  9a222f0000       lcall 0, 0x2f22                          -> 0000:2f22 [reloc]
  0579:0303  59               pop cx                                   
  0579:0304  83c606           add si, 6                                
  0579:0307  83fe1e           cmp si, 0x1e                             
  0579:030a  7f03             jg 0x30f                                 
  0579:030c  e962ff           jmp 0x271                                
  0579:030f  1e               push ds                                  
  0579:0310  689403           push 0x394                               
  0579:0313  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0579:0318  83c404           add sp, 4                                
  0579:031b  1e               push ds                                  
  0579:031c  68cf03           push 0x3cf                               
  0579:031f  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0579:0324  83c404           add sp, 4                                
  0579:0327  90               nop                                      
  0579:0328  0e               push cs                                  
  0579:0329  e88902           call 0x5b5                               -> 0579:05b5
  0579:032c  6a00             push 0                                   
  0579:032e  57               push di                                  
  0579:032f  9a5d06070c       lcall 0xc07, 0x65d                       -> 0c07:065d [reloc]
  0579:0334  83c404           add sp, 4                                
  0579:0337  33f6             xor si, si                               
  0579:0339  eb2d             jmp 0x368                                
  0579:033b  90               nop                                      
  0579:033c  0e               push cs                                  
  0579:033d  e8f800           call 0x438                               -> 0579:0438
  0579:0340  8bde             mov bx, si                               
  0579:0342  c1e302           shl bx, 2                                
  0579:0345  ffb70c04         push word ptr [bx + 0x40c]               
  0579:0349  8bde             mov bx, si                               
  0579:034b  c1e302           shl bx, 2                                
  0579:034e  ffb70a04         push word ptr [bx + 0x40a]               
  0579:0352  90               nop                                      
  0579:0353  0e               push cs                                  
  0579:0354  e80403           call 0x65b                               -> 0579:065b
  0579:0357  83c404           add sp, 4                                
  0579:035a  90               nop                                      
  0579:035b  0e               push cs                                  
  0579:035c  e85803           call 0x6b7                               -> 0579:06b7
  0579:035f  6a01             push 1                                   
  0579:0361  90               nop                                      
  0579:0362  0e               push cs                                  
  0579:0363  e82e01           call 0x494                               -> 0579:0494
  0579:0366  59               pop cx                                   
  0579:0367  46               inc si                                   
  0579:0368  3b368604         cmp si, word ptr [0x486]                 
  0579:036c  7ccd             jl 0x33b                                 
  0579:036e  90               nop                                      
  0579:036f  0e               push cs                                  
  0579:0370  e89502           call 0x608                               -> 0579:0608
  0579:0373  6a14             push 0x14                                
  0579:0375  90               nop                                      
  0579:0376  0e               push cs                                  
  0579:0377  e81a01           call 0x494                               -> 0579:0494
  0579:037a  59               pop cx                                   
  0579:037b  6a00             push 0                                   
  0579:037d  6a00             push 0                                   
  0579:037f  1e               push ds                                  
  0579:0380  685903           push 0x359                               
  0579:0383  68d200           push 0xd2                                
  0579:0386  68e001           push 0x1e0                               
  0579:0389  680401           push 0x104                               
  0579:038c  6a50             push 0x50                                
  0579:038e  1e               push ds                                  
  0579:038f  684c07           push 0x74c                               
  0579:0392  ff1ef615         lcall [0x15f6]                           
  0579:0396  83c414           add sp, 0x14                             
  0579:0399  1e               push ds                                  
  0579:039a  68f804           push 0x4f8                                ; "start\design.gfx"
  0579:039d  90               nop                                      
  0579:039e  0e               push cs                                  
  0579:039f  e8cf01           call 0x571                               -> 0579:0571
  0579:03a2  83c404           add sp, 4                                
  0579:03a5  1e               push ds                                  
  0579:03a6  680905           push 0x509                                ; "start\art.gfx"
  0579:03a9  90               nop                                      
  0579:03aa  0e               push cs                                  
  0579:03ab  e8c301           call 0x571                               -> 0579:0571
  0579:03ae  83c404           add sp, 4                                
  0579:03b1  1e               push ds                                  
  0579:03b2  681705           push 0x517                                ; "start\devel.gfx"
  0579:03b5  90               nop                                      
  0579:03b6  0e               push cs                                  
  0579:03b7  e8b701           call 0x571                               -> 0579:0571
  0579:03ba  83c404           add sp, 4                                
  0579:03bd  1e               push ds                                  
  0579:03be  682705           push 0x527                                ; "start\music.gfx"
  0579:03c1  90               nop                                      
  0579:03c2  0e               push cs                                  
  0579:03c3  e8ab01           call 0x571                               -> 0579:0571
  0579:03c6  83c404           add sp, 4                                
  0579:03c9  1e               push ds                                  
  0579:03ca  683705           push 0x537                                ; "start\assist.gfx"
  0579:03cd  90               nop                                      
  0579:03ce  0e               push cs                                  
  0579:03cf  e89f01           call 0x571                               -> 0579:0571
  0579:03d2  83c404           add sp, 4                                
  0579:03d5  1e               push ds                                  
  0579:03d6  684805           push 0x548                                ; "start\testing.gfx"
  0579:03d9  90               nop                                      
  0579:03da  0e               push cs                                  
  0579:03db  e89301           call 0x571                               -> 0579:0571
  0579:03de  83c404           add sp, 4                                
  0579:03e1  1e               push ds                                  
  0579:03e2  685a05           push 0x55a                                ; "start\testing2.gfx"
  0579:03e5  90               nop                                      
  0579:03e6  0e               push cs                                  
  0579:03e7  e88701           call 0x571                               -> 0579:0571
  0579:03ea  83c404           add sp, 4                                
  0579:03ed  57               push di                                  
  0579:03ee  9a1d06070c       lcall 0xc07, 0x61d                       -> 0c07:061d [reloc]
  0579:03f3  59               pop cx                                   
  0579:03f4  1e               push ds                                  
  0579:03f5  686e05           push 0x56e                                ; "start\black.pck"
  0579:03f8  1e               push ds                                  
  0579:03f9  686d05           push 0x56d                               
  0579:03fc  1e               push ds                                  
  0579:03fd  689403           push 0x394                               
  0579:0400  9a01006606       lcall 0x666, 1                           -> 0666:0001 [reloc]
  0579:0405  83c40c           add sp, 0xc                              
  0579:0408  1e               push ds                                  
  0579:0409  689403           push 0x394                               
  0579:040c  90               nop                                      
  0579:040d  0e               push cs                                  
  0579:040e  e8e700           call 0x4f8                               -> 0579:04f8
  0579:0411  83c404           add sp, 4                                
  0579:0414  1e               push ds                                  
  0579:0415  689403           push 0x394                               
  0579:0418  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0579:041d  83c404           add sp, 4                                
  0579:0420  1e               push ds                                  
  0579:0421  681e03           push 0x31e                               
  0579:0424  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0579:0429  83c404           add sp, 4                                
  0579:042c  6a02             push 2                                   
  0579:042e  9a03005105       lcall 0x551, 3                           -> 0551:0003 [reloc]
  0579:0433  59               pop cx                                   
  0579:0434  5f               pop di                                   
  0579:0435  5e               pop si                                   
  0579:0436  c9               leave                                    
  0579:0437  cb               retf                                     
  0579:0438  9ac9360000       lcall 0, 0x36c9                          -> 0000:36c9 [reloc]
  0579:043d  0bc0             or ax, ax                                
  0579:043f  7426             je 0x467                                 
  0579:0441  9af5340000       lcall 0, 0x34f5                          -> 0000:34f5 [reloc]
  0579:0446  8ad0             mov dl, al                               
  0579:0448  80fa20           cmp dl, 0x20                             
  0579:044b  740a             je 0x457                                 
  0579:044d  80fa1b           cmp dl, 0x1b                             
  0579:0450  7405             je 0x457                                 
  0579:0452  80fa0d           cmp dl, 0xd                              
  0579:0455  7510             jne 0x467                                
  0579:0457  6a02             push 2                                   
  0579:0459  9a03005105       lcall 0x551, 3                           -> 0551:0003 [reloc]
  0579:045e  59               pop cx                                   
  0579:045f  6a00             push 0                                   
  0579:0461  9a13012b06       lcall 0x62b, 0x113                       -> 062b:0113 [reloc]
  0579:0466  59               pop cx                                   
  0579:0467  cb               retf                                     
  0579:0468  c8040000         enter 4, 0                               
  0579:046c  16               push ss                                  
  0579:046d  8d46fc           lea ax, [bp - 4]                         
  0579:0470  50               push ax                                  
  0579:0471  9abd1b0000       lcall 0, 0x1bbd                          -> 0000:1bbd [reloc]
  0579:0476  83c404           add sp, 4                                
  0579:0479  807efc17         cmp byte ptr [bp - 4], 0x17              
  0579:047d  7511             jne 0x490                                
  0579:047f  807efd3b         cmp byte ptr [bp - 3], 0x3b              
  0579:0483  750b             jne 0x490                                
  0579:0485  807efe3a         cmp byte ptr [bp - 2], 0x3a              
  0579:0489  7605             jbe 0x490                                
  0579:048b  b80100           mov ax, 1                                
  0579:048e  eb02             jmp 0x492                                
  0579:0490  33c0             xor ax, ax                               
  0579:0492  c9               leave                                    
  0579:0493  cb               retf                                     
  0579:0494  c8080000         enter 8, 0                               
  0579:0498  0e               push cs                                  
  0579:0499  e8ccff           call 0x468                               -> 0579:0468
  0579:049c  0bc0             or ax, ax                                
  0579:049e  7556             jne 0x4f6                                
  0579:04a0  16               push ss                                  
  0579:04a1  8d46fc           lea ax, [bp - 4]                         
  0579:04a4  50               push ax                                  
  0579:04a5  6a00             push 0                                   
  0579:04a7  9a811b0000       lcall 0, 0x1b81                          -> 0000:1b81 [reloc]
  0579:04ac  83c406           add sp, 6                                
  0579:04af  8b46fe           mov ax, word ptr [bp - 2]                
  0579:04b2  8b56fc           mov dx, word ptr [bp - 4]                
  0579:04b5  8946fa           mov word ptr [bp - 6], ax                
  0579:04b8  8956f8           mov word ptr [bp - 8], dx                
  0579:04bb  eb1f             jmp 0x4dc                                
  0579:04bd  0e               push cs                                  
  0579:04be  e877ff           call 0x438                               -> 0579:0438
  0579:04c1  0e               push cs                                  
  0579:04c2  e8a3ff           call 0x468                               -> 0579:0468
  0579:04c5  0bc0             or ax, ax                                
  0579:04c7  752d             jne 0x4f6                                
  0579:04c9  16               push ss                                  
  0579:04ca  8d46f8           lea ax, [bp - 8]                         
  0579:04cd  50               push ax                                  
  0579:04ce  6a00             push 0                                   
  0579:04d0  9a811b0000       lcall 0, 0x1b81                          -> 0000:1b81 [reloc]
  0579:04d5  83c406           add sp, 6                                
  0579:04d8  0bc0             or ax, ax                                
  0579:04da  751a             jne 0x4f6                                
  0579:04dc  8b4606           mov ax, word ptr [bp + 6]                
  0579:04df  99               cdq                                      
  0579:04e0  8b5efe           mov bx, word ptr [bp - 2]                
  0579:04e3  8b4efc           mov cx, word ptr [bp - 4]                
  0579:04e6  03c8             add cx, ax                               
  0579:04e8  13da             adc bx, dx                               
  0579:04ea  3b5efa           cmp bx, word ptr [bp - 6]                
  0579:04ed  7fce             jg 0x4bd                                 
  0579:04ef  7505             jne 0x4f6                                
  0579:04f1  3b4ef8           cmp cx, word ptr [bp - 8]                
  0579:04f4  77c7             ja 0x4bd                                 
  0579:04f6  c9               leave                                    
  0579:04f7  cb               retf                                     
  0579:04f8  c8020000         enter 2, 0                               
  0579:04fc  56               push si                                  
  0579:04fd  57               push di                                  
  0579:04fe  c746fe0000       mov word ptr [bp - 2], 0                 
  0579:0503  33f6             xor si, si                               
  0579:0505  bfdf01           mov di, 0x1df                            
  0579:0508  eb59             jmp 0x563                                
  0579:050a  0e               push cs                                  
  0579:050b  e82aff           call 0x438                               -> 0579:0438
  0579:050e  56               push si                                  
  0579:050f  6a00             push 0                                   
  0579:0511  1e               push ds                                  
  0579:0512  684c07           push 0x74c                               
  0579:0515  6a01             push 1                                   
  0579:0517  688002           push 0x280                               
  0579:051a  56               push si                                  
  0579:051b  6a00             push 0                                   
  0579:051d  ff7608           push word ptr [bp + 8]                   
  0579:0520  ff7606           push word ptr [bp + 6]                   
  0579:0523  ff1ef615         lcall [0x15f6]                           
  0579:0527  83c414           add sp, 0x14                             
  0579:052a  57               push di                                  
  0579:052b  6a00             push 0                                   
  0579:052d  1e               push ds                                  
  0579:052e  684c07           push 0x74c                               
  0579:0531  6a01             push 1                                   
  0579:0533  688002           push 0x280                               
  0579:0536  57               push di                                  
  0579:0537  6a00             push 0                                   
  0579:0539  ff7608           push word ptr [bp + 8]                   
  0579:053c  ff7606           push word ptr [bp + 6]                   
  0579:053f  ff1ef615         lcall [0x15f6]                           
  0579:0543  83c414           add sp, 0x14                             
  0579:0546  8b46fe           mov ax, word ptr [bp - 2]                
  0579:0549  bb0400           mov bx, 4                                
  0579:054c  99               cdq                                      
  0579:054d  f7fb             idiv bx                                  
  0579:054f  0bd2             or dx, dx                                
  0579:0551  7507             jne 0x55a                                
  0579:0553  6a01             push 1                                   
  0579:0555  0e               push cs                                  
  0579:0556  e83bff           call 0x494                               -> 0579:0494
  0579:0559  59               pop cx                                   
  0579:055a  83c602           add si, 2                                
  0579:055d  83ef02           sub di, 2                                
  0579:0560  ff46fe           inc word ptr [bp - 2]                    
  0579:0563  81fee001         cmp si, 0x1e0                            
  0579:0567  7d04             jge 0x56d                                
  0579:0569  0bff             or di, di                                
  0579:056b  7f9d             jg 0x50a                                 
  0579:056d  5f               pop di                                   
  0579:056e  5e               pop si                                   
  0579:056f  c9               leave                                    
  0579:0570  cb               retf                                     

proc_0579_0571:
  0579:0571  55               push bp                                  
  0579:0572  8bec             mov bp, sp                               
  0579:0574  680401           push 0x104                               
  0579:0577  6a50             push 0x50                                
  0579:0579  ff7608           push word ptr [bp + 8]                   
  0579:057c  ff7606           push word ptr [bp + 6]                   
  0579:057f  90               nop                                      
  0579:0580  0e               push cs                                  
  0579:0581  e83403           call 0x8b8                               -> 0579:08b8
  0579:0584  83c408           add sp, 8                                
  0579:0587  6a3c             push 0x3c                                
  0579:0589  0e               push cs                                  
  0579:058a  e807ff           call 0x494                               -> 0579:0494
  0579:058d  59               pop cx                                   
  0579:058e  680401           push 0x104                               
  0579:0591  6a50             push 0x50                                
  0579:0593  1e               push ds                                  
  0579:0594  684c07           push 0x74c                               
  0579:0597  68d200           push 0xd2                                
  0579:059a  68e001           push 0x1e0                               
  0579:059d  6a00             push 0                                   
  0579:059f  6a00             push 0                                   
  0579:05a1  1e               push ds                                  
  0579:05a2  685903           push 0x359                               
  0579:05a5  ff1ef615         lcall [0x15f6]                           
  0579:05a9  83c414           add sp, 0x14                             
  0579:05ac  6a05             push 5                                   
  0579:05ae  0e               push cs                                  
  0579:05af  e8e2fe           call 0x494                               -> 0579:0494
  0579:05b2  59               pop cx                                   
  0579:05b3  5d               pop bp                                   
  0579:05b4  cb               retf                                     
  0579:05b5  c8020000         enter 2, 0                               
  0579:05b9  c746fe0000       mov word ptr [bp - 2], 0                 
  0579:05be  1e               push ds                                  
  0579:05bf  687f05           push 0x57f                                ; "start\sparkle.pck"
  0579:05c2  1e               push ds                                  
  0579:05c3  687e05           push 0x57e                               
  0579:05c6  1e               push ds                                  
  0579:05c7  685d14           push 0x145d                              
  0579:05ca  9a01006606       lcall 0x666, 1                           -> 0666:0001 [reloc]
  0579:05cf  83c40c           add sp, 0xc                              
  0579:05d2  6a0d             push 0xd                                 
  0579:05d4  1e               push ds                                  
  0579:05d5  682214           push 0x1422                              
  0579:05d8  1e               push ds                                  
  0579:05d9  685d14           push 0x145d                              
  0579:05dc  16               push ss                                  
  0579:05dd  8d46fe           lea ax, [bp - 2]                         
  0579:05e0  50               push ax                                  
  0579:05e1  9ad000c30b       lcall 0xbc3, 0xd0                        -> 0bc3:00d0 [reloc]
  0579:05e6  83c40e           add sp, 0xe                              
  0579:05e9  6a00             push 0                                   
  0579:05eb  6a00             push 0                                   
  0579:05ed  1e               push ds                                  
  0579:05ee  681e03           push 0x31e                               
  0579:05f1  68d200           push 0xd2                                
  0579:05f4  68e001           push 0x1e0                               
  0579:05f7  6a1e             push 0x1e                                
  0579:05f9  6a50             push 0x50                                
  0579:05fb  1e               push ds                                  
  0579:05fc  684c07           push 0x74c                               
  0579:05ff  ff1ef615         lcall [0x15f6]                           
  0579:0603  83c414           add sp, 0x14                             
  0579:0606  c9               leave                                    
  0579:0607  cb               retf                                     
  0579:0608  6a00             push 0                                   
  0579:060a  6a00             push 0                                   
  0579:060c  1e               push ds                                  
  0579:060d  685903           push 0x359                               
  0579:0610  68d200           push 0xd2                                
  0579:0613  68e001           push 0x1e0                               
  0579:0616  6a00             push 0                                   
  0579:0618  6a00             push 0                                   
  0579:061a  1e               push ds                                  
  0579:061b  681e03           push 0x31e                               
  0579:061e  ff1ef615         lcall [0x15f6]                           
  0579:0622  83c414           add sp, 0x14                             
  0579:0625  6a1e             push 0x1e                                
  0579:0627  6a50             push 0x50                                
  0579:0629  1e               push ds                                  
  0579:062a  684c07           push 0x74c                               
  0579:062d  68d200           push 0xd2                                
  0579:0630  68e001           push 0x1e0                               
  0579:0633  6a00             push 0                                   
  0579:0635  6a00             push 0                                   
  0579:0637  1e               push ds                                  
  0579:0638  685903           push 0x359                               
  0579:063b  ff1ef615         lcall [0x15f6]                           
  0579:063f  83c414           add sp, 0x14                             
  0579:0642  1e               push ds                                  
  0579:0643  685d14           push 0x145d                              
  0579:0646  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0579:064b  83c404           add sp, 4                                
  0579:064e  1e               push ds                                  
  0579:064f  682214           push 0x1422                              
  0579:0652  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0579:0657  83c404           add sp, 4                                
  0579:065a  cb               retf                                     

proc_0579_065b:
  0579:065b  55               push bp                                  
  0579:065c  8bec             mov bp, sp                               
  0579:065e  56               push si                                  
  0579:065f  8b4e06           mov cx, word ptr [bp + 6]                
  0579:0662  8b7608           mov si, word ptr [bp + 8]                
  0579:0665  0bc9             or cx, cx                                
  0579:0667  7c4b             jl 0x6b4                                 
  0579:0669  0bf6             or si, si                                
  0579:066b  7c47             jl 0x6b4                                 
  0579:066d  33d2             xor dx, dx                               
  0579:066f  eb3e             jmp 0x6af                                
  0579:0671  8bda             mov bx, dx                               
  0579:0673  d1e3             shl bx, 1                                
  0579:0675  83bffa1300       cmp word ptr [bx + 0x13fa], 0            
  0579:067a  7532             jne 0x6ae                                
  0579:067c  8bda             mov bx, dx                               
  0579:067e  d1e3             shl bx, 1                                
  0579:0680  c787fa130100     mov word ptr [bx + 0x13fa], 1            
  0579:0686  8bda             mov bx, dx                               
  0579:0688  c1e302           shl bx, 2                                
  0579:068b  8bc1             mov ax, cx                               
  0579:068d  05b0ff           add ax, 0xffb0                           
  0579:0690  8987aa13         mov word ptr [bx + 0x13aa], ax           
  0579:0694  8bda             mov bx, dx                               
  0579:0696  c1e302           shl bx, 2                                
  0579:0699  8bc6             mov ax, si                               
  0579:069b  05e2ff           add ax, 0xffe2                           
  0579:069e  8987ac13         mov word ptr [bx + 0x13ac], ax           
  0579:06a2  8bda             mov bx, dx                               
  0579:06a4  d1e3             shl bx, 1                                
  0579:06a6  c78782130000     mov word ptr [bx + 0x1382], 0            
  0579:06ac  eb06             jmp 0x6b4                                
  0579:06ae  42               inc dx                                   
  0579:06af  83fa14           cmp dx, 0x14                             
  0579:06b2  7cbd             jl 0x671                                 
  0579:06b4  5e               pop si                                   
  0579:06b5  5d               pop bp                                   
  0579:06b6  cb               retf                                     
  0579:06b7  56               push si                                  
  0579:06b8  6a00             push 0                                   
  0579:06ba  6a00             push 0                                   
  0579:06bc  1e               push ds                                  
  0579:06bd  685903           push 0x359                               
  0579:06c0  68d200           push 0xd2                                
  0579:06c3  68e001           push 0x1e0                               
  0579:06c6  6a00             push 0                                   
  0579:06c8  6a00             push 0                                   
  0579:06ca  1e               push ds                                  
  0579:06cb  681e03           push 0x31e                               
  0579:06ce  ff1ef615         lcall [0x15f6]                           
  0579:06d2  83c414           add sp, 0x14                             
  0579:06d5  33f6             xor si, si                               
  0579:06d7  eb72             jmp 0x74b                                
  0579:06d9  8bde             mov bx, si                               
  0579:06db  d1e3             shl bx, 1                                
  0579:06dd  83bffa1300       cmp word ptr [bx + 0x13fa], 0            
  0579:06e2  7466             je 0x74a                                 
  0579:06e4  6a00             push 0                                   
  0579:06e6  8bde             mov bx, si                               
  0579:06e8  d1e3             shl bx, 1                                
  0579:06ea  8b9f8213         mov bx, word ptr [bx + 0x1382]           
  0579:06ee  d1e3             shl bx, 1                                
  0579:06f0  ffb78804         push word ptr [bx + 0x488]               
  0579:06f4  1e               push ds                                  
  0579:06f5  682214           push 0x1422                              
  0579:06f8  8bde             mov bx, si                               
  0579:06fa  c1e302           shl bx, 2                                
  0579:06fd  ffb7ac13         push word ptr [bx + 0x13ac]              
  0579:0701  8bde             mov bx, si                               
  0579:0703  c1e302           shl bx, 2                                
  0579:0706  ffb7aa13         push word ptr [bx + 0x13aa]              
  0579:070a  1e               push ds                                  
  0579:070b  685903           push 0x359                               
  0579:070e  6a29             push 0x29                                
  0579:0710  6a20             push 0x20                                
  0579:0712  6a00             push 0                                   
  0579:0714  8bde             mov bx, si                               
  0579:0716  d1e3             shl bx, 1                                
  0579:0718  8b9f8213         mov bx, word ptr [bx + 0x1382]           
  0579:071c  d1e3             shl bx, 1                                
  0579:071e  ffb78804         push word ptr [bx + 0x488]               
  0579:0722  1e               push ds                                  
  0579:0723  685d14           push 0x145d                              
  0579:0726  ff1eea15         lcall [0x15ea]                           
  0579:072a  83c41c           add sp, 0x1c                             
  0579:072d  8bde             mov bx, si                               
  0579:072f  d1e3             shl bx, 1                                
  0579:0731  ff878213         inc word ptr [bx + 0x1382]               
  0579:0735  8bde             mov bx, si                               
  0579:0737  d1e3             shl bx, 1                                
  0579:0739  83bf821307       cmp word ptr [bx + 0x1382], 7            
  0579:073e  7c0a             jl 0x74a                                 
  0579:0740  8bde             mov bx, si                               
  0579:0742  d1e3             shl bx, 1                                
  0579:0744  c787fa130000     mov word ptr [bx + 0x13fa], 0            
  0579:074a  46               inc si                                   
  0579:074b  83fe14           cmp si, 0x14                             
  0579:074e  7c89             jl 0x6d9                                 
  0579:0750  6a1e             push 0x1e                                
  0579:0752  6a50             push 0x50                                
  0579:0754  1e               push ds                                  
  0579:0755  684c07           push 0x74c                               
  0579:0758  68d200           push 0xd2                                
  0579:075b  68e001           push 0x1e0                               
  0579:075e  6a00             push 0                                   
  0579:0760  6a00             push 0                                   
  0579:0762  1e               push ds                                  
  0579:0763  685903           push 0x359                               
  0579:0766  ff1ef615         lcall [0x15f6]                           
  0579:076a  83c414           add sp, 0x14                             
  0579:076d  5e               pop si                                   
  0579:076e  cb               retf                                     

proc_0579_076f:
  0579:076f  55               push bp                                  
  0579:0770  8bec             mov bp, sp                               
  0579:0772  ff7608           push word ptr [bp + 8]                   
  0579:0775  ff7606           push word ptr [bp + 6]                   
  0579:0778  9a08400000       lcall 0, 0x4008                          -> 0000:4008 [reloc]
  0579:077d  83c404           add sp, 4                                
  0579:0780  6a02             push 2                                   
  0579:0782  9a13012b06       lcall 0x62b, 0x113                       -> 062b:0113 [reloc]
  0579:0787  59               pop cx                                   
  0579:0788  5d               pop bp                                   
  0579:0789  cb               retf                                     

proc_0579_078a:
  0579:078a  55               push bp                                  
  0579:078b  8bec             mov bp, sp                               
  0579:078d  ff760c           push word ptr [bp + 0xc]                 
  0579:0790  ff760a           push word ptr [bp + 0xa]                 
  0579:0793  ff7608           push word ptr [bp + 8]                   
  0579:0796  ff7606           push word ptr [bp + 6]                   
  0579:0799  9aa404e809       lcall 0x9e8, 0x4a4                       -> 09e8:04a4 [reloc]
  0579:079e  83c408           add sp, 8                                
  0579:07a1  5d               pop bp                                   
  0579:07a2  cb               retf                                     

proc_0579_07a3:
  0579:07a3  55               push bp                                  
  0579:07a4  8bec             mov bp, sp                               
  0579:07a6  56               push si                                  
  0579:07a7  8b7606           mov si, word ptr [bp + 6]                
  0579:07aa  ff760c           push word ptr [bp + 0xc]                 
  0579:07ad  ff760a           push word ptr [bp + 0xa]                 
  0579:07b0  9a880ae809       lcall 0x9e8, 0xa88                       -> 09e8:0a88 [reloc]
  0579:07b5  83c404           add sp, 4                                
  0579:07b8  99               cdq                                      
  0579:07b9  2bc2             sub ax, dx                               
  0579:07bb  d1f8             sar ax, 1                                
  0579:07bd  2bf0             sub si, ax                               
  0579:07bf  ff760c           push word ptr [bp + 0xc]                 
  0579:07c2  ff760a           push word ptr [bp + 0xa]                 
  0579:07c5  ff7608           push word ptr [bp + 8]                   
  0579:07c8  56               push si                                  
  0579:07c9  9aa404e809       lcall 0x9e8, 0x4a4                       -> 09e8:04a4 [reloc]
  0579:07ce  83c408           add sp, 8                                
  0579:07d1  5e               pop si                                   
  0579:07d2  5d               pop bp                                   
  0579:07d3  cb               retf                                     

proc_0579_07d4:
  0579:07d4  55               push bp                                  
  0579:07d5  8bec             mov bp, sp                               
  0579:07d7  56               push si                                  
  0579:07d8  8b7606           mov si, word ptr [bp + 6]                
  0579:07db  ff760c           push word ptr [bp + 0xc]                 
  0579:07de  ff760a           push word ptr [bp + 0xa]                 
  0579:07e1  9a880ae809       lcall 0x9e8, 0xa88                       -> 09e8:0a88 [reloc]
  0579:07e6  83c404           add sp, 4                                
  0579:07e9  2bf0             sub si, ax                               
  0579:07eb  ff760c           push word ptr [bp + 0xc]                 
  0579:07ee  ff760a           push word ptr [bp + 0xa]                 
  0579:07f1  ff7608           push word ptr [bp + 8]                   
  0579:07f4  56               push si                                  
  0579:07f5  9aa404e809       lcall 0x9e8, 0x4a4                       -> 09e8:04a4 [reloc]
  0579:07fa  83c408           add sp, 8                                
  0579:07fd  5e               pop si                                   
  0579:07fe  5d               pop bp                                   
  0579:07ff  cb               retf                                     
  0579:0800  c80e0000         enter 0xe, 0                             
  0579:0804  56               push si                                  
  0579:0805  57               push di                                  
  0579:0806  33ff             xor di, di                               
  0579:0808  c746f20000       mov word ptr [bp - 0xe], 0               
  0579:080d  6a02             push 2                                   
  0579:080f  ff7608           push word ptr [bp + 8]                   
  0579:0812  ff7606           push word ptr [bp + 6]                   
  0579:0815  9a0e004a06       lcall 0x64a, 0xe                         -> 064a:000e [reloc]
  0579:081a  83c406           add sp, 6                                
  0579:081d  8bf0             mov si, ax                               
  0579:081f  0bf6             or si, si                                
  0579:0821  7d05             jge 0x828                                
  0579:0823  33c0             xor ax, ax                               
  0579:0825  e98c00           jmp 0x8b4                                
  0579:0828  56               push si                                  
  0579:0829  9ab1004a06       lcall 0x64a, 0xb1                        -> 064a:00b1 [reloc]
  0579:082e  59               pop cx                                   
  0579:082f  8946fe           mov word ptr [bp - 2], ax                
  0579:0832  50               push ax                                  
  0579:0833  9acf01870c       lcall 0xc87, 0x1cf                       -> 0c87:01cf [reloc]
  0579:0838  59               pop cx                                   
  0579:0839  8956fc           mov word ptr [bp - 4], dx                
  0579:083c  8946fa           mov word ptr [bp - 6], ax                
  0579:083f  8b46fc           mov ax, word ptr [bp - 4]                
  0579:0842  8b56fa           mov dx, word ptr [bp - 6]                
  0579:0845  8946f8           mov word ptr [bp - 8], ax                
  0579:0848  8956f6           mov word ptr [bp - 0xa], dx              
  0579:084b  ff76fe           push word ptr [bp - 2]                   
  0579:084e  50               push ax                                  
  0579:084f  52               push dx                                  
  0579:0850  56               push si                                  
  0579:0851  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  0579:0856  83c408           add sp, 8                                
  0579:0859  eb3d             jmp 0x898                                
  0579:085b  ff46f6           inc word ptr [bp - 0xa]                  
  0579:085e  c45ef6           les bx, ptr [bp - 0xa]                   
  0579:0861  26803f23         cmp byte ptr es:[bx], 0x23               
  0579:0865  75f4             jne 0x85b                                
  0579:0867  ff46f6           inc word ptr [bp - 0xa]                  
  0579:086a  c45ef6           les bx, ptr [bp - 0xa]                   
  0579:086d  268a07           mov al, byte ptr es:[bx]                 
  0579:0870  8846f5           mov byte ptr [bp - 0xb], al              
  0579:0873  ff46f6           inc word ptr [bp - 0xa]                  
  0579:0876  98               cwde                                     
  0579:0877  3d4400           cmp ax, 0x44                             
  0579:087a  7407             je 0x883                                 
  0579:087c  3d4500           cmp ax, 0x45                             
  0579:087f  7414             je 0x895                                 
  0579:0881  eb15             jmp 0x898                                
  0579:0883  16               push ss                                  
  0579:0884  8d46f2           lea ax, [bp - 0xe]                       
  0579:0887  50               push ax                                  
  0579:0888  16               push ss                                  
  0579:0889  8d46f6           lea ax, [bp - 0xa]                       
  0579:088c  50               push ax                                  
  0579:088d  90               nop                                      
  0579:088e  0e               push cs                                  
  0579:088f  e8df01           call 0xa71                               -> 0579:0a71
  0579:0892  83c408           add sp, 8                                
  0579:0895  bf0100           mov di, 1                                
  0579:0898  0bff             or di, di                                
  0579:089a  74c2             je 0x85e                                 
  0579:089c  ff76fc           push word ptr [bp - 4]                   
  0579:089f  ff76fa           push word ptr [bp - 6]                   
  0579:08a2  9a0705870c       lcall 0xc87, 0x507                       -> 0c87:0507 [reloc]
  0579:08a7  83c404           add sp, 4                                
  0579:08aa  56               push si                                  
  0579:08ab  9a42004a06       lcall 0x64a, 0x42                        -> 064a:0042 [reloc]
  0579:08b0  59               pop cx                                   
  0579:08b1  8b46f2           mov ax, word ptr [bp - 0xe]              
  0579:08b4  5f               pop di                                   
  0579:08b5  5e               pop si                                   
  0579:08b6  c9               leave                                    
  0579:08b7  cb               retf                                     
  0579:08b8  c8620000         enter 0x62, 0                            
  0579:08bc  56               push si                                  
  0579:08bd  57               push di                                  
  0579:08be  33ff             xor di, di                               
  0579:08c0  8b460a           mov ax, word ptr [bp + 0xa]              
  0579:08c3  a38013           mov word ptr [0x1380], ax                
  0579:08c6  8b460c           mov ax, word ptr [bp + 0xc]              
  0579:08c9  a37e13           mov word ptr [0x137e], ax                
  0579:08cc  6a02             push 2                                   
  0579:08ce  ff7608           push word ptr [bp + 8]                   
  0579:08d1  ff7606           push word ptr [bp + 6]                   
  0579:08d4  9a0e004a06       lcall 0x64a, 0xe                         -> 064a:000e [reloc]
  0579:08d9  83c406           add sp, 6                                
  0579:08dc  8bf0             mov si, ax                               
  0579:08de  0bf6             or si, si                                
  0579:08e0  7d03             jge 0x8e5                                
  0579:08e2  e96401           jmp 0xa49                                
  0579:08e5  56               push si                                  
  0579:08e6  9ab1004a06       lcall 0x64a, 0xb1                        -> 064a:00b1 [reloc]
  0579:08eb  59               pop cx                                   
  0579:08ec  8946fe           mov word ptr [bp - 2], ax                
  0579:08ef  50               push ax                                  
  0579:08f0  9acf01870c       lcall 0xc87, 0x1cf                       -> 0c87:01cf [reloc]
  0579:08f5  59               pop cx                                   
  0579:08f6  8956fc           mov word ptr [bp - 4], dx                
  0579:08f9  8946fa           mov word ptr [bp - 6], ax                
  0579:08fc  8b46fc           mov ax, word ptr [bp - 4]                
  0579:08ff  8b56fa           mov dx, word ptr [bp - 6]                
  0579:0902  8946f8           mov word ptr [bp - 8], ax                
  0579:0905  8956f6           mov word ptr [bp - 0xa], dx              
  0579:0908  ff76fe           push word ptr [bp - 2]                   
  0579:090b  50               push ax                                  
  0579:090c  52               push dx                                  
  0579:090d  56               push si                                  
  0579:090e  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  0579:0913  83c408           add sp, 8                                
  0579:0916  9aa907a30a       lcall 0xaa3, 0x7a9                       -> 0aa3:07a9 [reloc]
  0579:091b  e90a01           jmp 0xa28                                
  0579:091e  ff46f6           inc word ptr [bp - 0xa]                  
  0579:0921  c45ef6           les bx, ptr [bp - 0xa]                   
  0579:0924  26803f23         cmp byte ptr es:[bx], 0x23               
  0579:0928  75f4             jne 0x91e                                
  0579:092a  ff46f6           inc word ptr [bp - 0xa]                  
  0579:092d  c45ef6           les bx, ptr [bp - 0xa]                   
  0579:0930  268a07           mov al, byte ptr es:[bx]                 
  0579:0933  8846f1           mov byte ptr [bp - 0xf], al              
  0579:0936  ff46f6           inc word ptr [bp - 0xa]                  
  0579:0939  98               cwde                                     
  0579:093a  2d4300           sub ax, 0x43                             
  0579:093d  8bd8             mov bx, ax                               
  0579:093f  83fb11           cmp bx, 0x11                             
  0579:0942  7603             jbe 0x947                                
  0579:0944  e9e100           jmp 0xa28                                
  0579:0947  d1e3             shl bx, 1                                
  0579:0949  2effa74d0a       jmp word ptr cs:[bx + 0xa4d]             
  0579:094e  16               push ss                                  
  0579:094f  8d46ee           lea ax, [bp - 0x12]                      
  0579:0952  50               push ax                                  
  0579:0953  16               push ss                                  
  0579:0954  8d46f6           lea ax, [bp - 0xa]                       
  0579:0957  50               push ax                                  
  0579:0958  90               nop                                      
  0579:0959  0e               push cs                                  
  0579:095a  e81401           call 0xa71                               -> 0579:0a71
  0579:095d  83c408           add sp, 8                                
  0579:0960  6a03             push 3                                   
  0579:0962  6a00             push 0                                   
  0579:0964  ff76ee           push word ptr [bp - 0x12]                
  0579:0967  6a02             push 2                                   
  0579:0969  9ad8068a04       lcall 0x48a, 0x6d8                       -> 048a:06d8 [reloc]
  0579:096e  e9af00           jmp 0xa20                                
  0579:0971  6a03             push 3                                   
  0579:0973  6a00             push 0                                   
  0579:0975  6a0f             push 0xf                                 
  0579:0977  6a01             push 1                                   
  0579:0979  ebee             jmp 0x969                                
  0579:097b  6a03             push 3                                   
  0579:097d  6a00             push 0                                   
  0579:097f  6a0f             push 0xf                                 
  0579:0981  ebe4             jmp 0x967                                
  0579:0983  16               push ss                                  
  0579:0984  8d46f2           lea ax, [bp - 0xe]                       
  0579:0987  50               push ax                                  
  0579:0988  16               push ss                                  
  0579:0989  8d46f6           lea ax, [bp - 0xa]                       
  0579:098c  50               push ax                                  
  0579:098d  90               nop                                      
  0579:098e  0e               push cs                                  
  0579:098f  e81a01           call 0xaac                               -> 0579:0aac
  0579:0992  83c408           add sp, 8                                
  0579:0995  16               push ss                                  
  0579:0996  8d469e           lea ax, [bp - 0x62]                      
  0579:0999  50               push ax                                  
  0579:099a  16               push ss                                  
  0579:099b  8d46f6           lea ax, [bp - 0xa]                       
  0579:099e  50               push ax                                  
  0579:099f  90               nop                                      
  0579:09a0  0e               push cs                                  
  0579:09a1  e85501           call 0xaf9                               -> 0579:0af9
  0579:09a4  83c408           add sp, 8                                
  0579:09a7  16               push ss                                  
  0579:09a8  8d469e           lea ax, [bp - 0x62]                      
  0579:09ab  50               push ax                                  
  0579:09ac  ff76f4           push word ptr [bp - 0xc]                 
  0579:09af  ff76f2           push word ptr [bp - 0xe]                 
  0579:09b2  0e               push cs                                  
  0579:09b3  e8edfd           call 0x7a3                               -> 0579:07a3
  0579:09b6  eb68             jmp 0xa20                                
  0579:09b8  16               push ss                                  
  0579:09b9  8d46f2           lea ax, [bp - 0xe]                       
  0579:09bc  50               push ax                                  
  0579:09bd  16               push ss                                  
  0579:09be  8d46f6           lea ax, [bp - 0xa]                       
  0579:09c1  50               push ax                                  
  0579:09c2  90               nop                                      
  0579:09c3  0e               push cs                                  
  0579:09c4  e8e500           call 0xaac                               -> 0579:0aac
  0579:09c7  83c408           add sp, 8                                
  0579:09ca  16               push ss                                  
  0579:09cb  8d469e           lea ax, [bp - 0x62]                      
  0579:09ce  50               push ax                                  
  0579:09cf  16               push ss                                  
  0579:09d0  8d46f6           lea ax, [bp - 0xa]                       
  0579:09d3  50               push ax                                  
  0579:09d4  90               nop                                      
  0579:09d5  0e               push cs                                  
  0579:09d6  e82001           call 0xaf9                               -> 0579:0af9
  0579:09d9  83c408           add sp, 8                                
  0579:09dc  16               push ss                                  
  0579:09dd  8d469e           lea ax, [bp - 0x62]                      
  0579:09e0  50               push ax                                  
  0579:09e1  ff76f4           push word ptr [bp - 0xc]                 
  0579:09e4  ff76f2           push word ptr [bp - 0xe]                 
  0579:09e7  0e               push cs                                  
  0579:09e8  e89ffd           call 0x78a                               -> 0579:078a
  0579:09eb  eb33             jmp 0xa20                                
  0579:09ed  16               push ss                                  
  0579:09ee  8d46f2           lea ax, [bp - 0xe]                       
  0579:09f1  50               push ax                                  
  0579:09f2  16               push ss                                  
  0579:09f3  8d46f6           lea ax, [bp - 0xa]                       
  0579:09f6  50               push ax                                  
  0579:09f7  90               nop                                      
  0579:09f8  0e               push cs                                  
  0579:09f9  e8b000           call 0xaac                               -> 0579:0aac
  0579:09fc  83c408           add sp, 8                                
  0579:09ff  16               push ss                                  
  0579:0a00  8d469e           lea ax, [bp - 0x62]                      
  0579:0a03  50               push ax                                  
  0579:0a04  16               push ss                                  
  0579:0a05  8d46f6           lea ax, [bp - 0xa]                       
  0579:0a08  50               push ax                                  
  0579:0a09  90               nop                                      
  0579:0a0a  0e               push cs                                  
  0579:0a0b  e8eb00           call 0xaf9                               -> 0579:0af9
  0579:0a0e  83c408           add sp, 8                                
  0579:0a11  16               push ss                                  
  0579:0a12  8d469e           lea ax, [bp - 0x62]                      
  0579:0a15  50               push ax                                  
  0579:0a16  ff76f4           push word ptr [bp - 0xc]                 
  0579:0a19  ff76f2           push word ptr [bp - 0xe]                 
  0579:0a1c  0e               push cs                                  
  0579:0a1d  e8b4fd           call 0x7d4                               -> 0579:07d4
  0579:0a20  83c408           add sp, 8                                
  0579:0a23  eb03             jmp 0xa28                                
  0579:0a25  bf0100           mov di, 1                                
  0579:0a28  0bff             or di, di                                
  0579:0a2a  7503             jne 0xa2f                                
  0579:0a2c  e9f2fe           jmp 0x921                                
  0579:0a2f  ff76fc           push word ptr [bp - 4]                   
  0579:0a32  ff76fa           push word ptr [bp - 6]                   
  0579:0a35  9a0705870c       lcall 0xc87, 0x507                       -> 0c87:0507 [reloc]
  0579:0a3a  83c404           add sp, 4                                
  0579:0a3d  56               push si                                  
  0579:0a3e  9a42004a06       lcall 0x64a, 0x42                        -> 064a:0042 [reloc]
  0579:0a43  59               pop cx                                   
  0579:0a44  9a5b07a30a       lcall 0xaa3, 0x75b                       -> 0aa3:075b [reloc]
  0579:0a49  5f               pop di                                   
  0579:0a4a  5e               pop si                                   
  0579:0a4b  c9               leave                                    
  0579:0a4c  cb               retf                                     
  0579:0a4d  830928           or word ptr [bx + di], 0x28              
  0579:0a50  0a25             or ah, byte ptr [di]                     
  0579:0a52  0a4e09           or cl, byte ptr [bp + 9]                 
  0579:0a55  280a             sub byte ptr [bp + si], cl               
  0579:0a57  7109             jno 0xa62                                
  0579:0a59  280a             sub byte ptr [bp + si], cl               
  0579:0a5b  280a             sub byte ptr [bp + si], cl               
  0579:0a5d  280a             sub byte ptr [bp + si], cl               
  0579:0a5f  b80928           mov ax, 0x2809                           
  0579:0a62  0a28             or ch, byte ptr [bx + si]                
  0579:0a64  0a28             or ch, byte ptr [bx + si]                
  0579:0a66  0a28             or ch, byte ptr [bx + si]                
  0579:0a68  0a28             or ch, byte ptr [bx + si]                
  0579:0a6a  0aed             or ch, ch                                
  0579:0a6c  0928             or word ptr [bx + si], bp                
  0579:0a6e  0a7b09           or bh, byte ptr [bp + di + 9]            

proc_0579_0a71:
  0579:0a71  55               push bp                                  
  0579:0a72  8bec             mov bp, sp                               
  0579:0a74  c45e06           les bx, ptr [bp + 6]                     
  0579:0a77  26c41f           les bx, ptr es:[bx]                      
  0579:0a7a  268a07           mov al, byte ptr es:[bx]                 
  0579:0a7d  98               cwde                                     
  0579:0a7e  05d0ff           add ax, 0xffd0                           
  0579:0a81  6bc064           imul ax, ax, 0x64                        
  0579:0a84  50               push ax                                  
  0579:0a85  268a4701         mov al, byte ptr es:[bx + 1]             
  0579:0a89  98               cwde                                     
  0579:0a8a  05d0ff           add ax, 0xffd0                           
  0579:0a8d  6bc00a           imul ax, ax, 0xa                         
  0579:0a90  5a               pop dx                                   
  0579:0a91  03d0             add dx, ax                               
  0579:0a93  268a4702         mov al, byte ptr es:[bx + 2]             
  0579:0a97  98               cwde                                     
  0579:0a98  03d0             add dx, ax                               
  0579:0a9a  83c2d0           add dx, -0x30                            
  0579:0a9d  c45e0a           les bx, ptr [bp + 0xa]                   
  0579:0aa0  268917           mov word ptr es:[bx], dx                 
  0579:0aa3  c45e06           les bx, ptr [bp + 6]                     
  0579:0aa6  26830703         add word ptr es:[bx], 3                  
  0579:0aaa  5d               pop bp                                   
  0579:0aab  cb               retf                                     

proc_0579_0aac:
  0579:0aac  55               push bp                                  
  0579:0aad  8bec             mov bp, sp                               
  0579:0aaf  c45e06           les bx, ptr [bp + 6]                     
  0579:0ab2  26ff07           inc word ptr es:[bx]                     
  0579:0ab5  ff760c           push word ptr [bp + 0xc]                 
  0579:0ab8  ff760a           push word ptr [bp + 0xa]                 
  0579:0abb  ff7608           push word ptr [bp + 8]                   
  0579:0abe  53               push bx                                  
  0579:0abf  0e               push cs                                  
  0579:0ac0  e8aeff           call 0xa71                               -> 0579:0a71
  0579:0ac3  83c408           add sp, 8                                
  0579:0ac6  c45e06           les bx, ptr [bp + 6]                     
  0579:0ac9  26ff07           inc word ptr es:[bx]                     
  0579:0acc  8b460a           mov ax, word ptr [bp + 0xa]              
  0579:0acf  050200           add ax, 2                                
  0579:0ad2  ff760c           push word ptr [bp + 0xc]                 
  0579:0ad5  50               push ax                                  
  0579:0ad6  ff7608           push word ptr [bp + 8]                   
  0579:0ad9  53               push bx                                  
  0579:0ada  0e               push cs                                  
  0579:0adb  e893ff           call 0xa71                               -> 0579:0a71
  0579:0ade  83c408           add sp, 8                                
  0579:0ae1  c45e06           les bx, ptr [bp + 6]                     
  0579:0ae4  26ff07           inc word ptr es:[bx]                     
  0579:0ae7  c45e0a           les bx, ptr [bp + 0xa]                   
  0579:0aea  a18013           mov ax, word ptr [0x1380]                
  0579:0aed  260107           add word ptr es:[bx], ax                 
  0579:0af0  a17e13           mov ax, word ptr [0x137e]                
  0579:0af3  26014702         add word ptr es:[bx + 2], ax             
  0579:0af7  5d               pop bp                                   
  0579:0af8  cb               retf                                     

proc_0579_0af9:
  0579:0af9  55               push bp                                  
  0579:0afa  8bec             mov bp, sp                               
  0579:0afc  33d2             xor dx, dx                               
  0579:0afe  eb12             jmp 0xb12                                
  0579:0b00  c45e06           les bx, ptr [bp + 6]                     
  0579:0b03  26c41f           les bx, ptr es:[bx]                      
  0579:0b06  268a07           mov al, byte ptr es:[bx]                 
  0579:0b09  c45e0a           les bx, ptr [bp + 0xa]                   
  0579:0b0c  03da             add bx, dx                               
  0579:0b0e  268807           mov byte ptr es:[bx], al                 
  0579:0b11  42               inc dx                                   
  0579:0b12  c45e06           les bx, ptr [bp + 6]                     
  0579:0b15  26ff07           inc word ptr es:[bx]                     
  0579:0b18  c45e06           les bx, ptr [bp + 6]                     
  0579:0b1b  26c41f           les bx, ptr es:[bx]                      
  0579:0b1e  26               db 26
  0579:0b1f  80               db 80
