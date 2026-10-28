; seg 0b75  img 0xb750..0xbc30  file off 0xc350
  0b75:0000  1e               push ds                                  
  0b75:0001  5b               pop bx                                   
  0b75:0002  1a668b           sbb ah, byte ptr [bp - 0x75]             
  0b75:0005  46               inc si                                   
  0b75:0006  06               push es                                  
  0b75:0007  6626894761       mov dword ptr es:[bx + 0x61], eax        
  0b75:000c  5d               pop bp                                   
  0b75:000d  cb               retf                                     
  0b75:000e  c8020000         enter 2, 0                               
  0b75:0012  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0016  268b475d         mov ax, word ptr es:[bx + 0x5d]          
  0b75:001a  8946fe           mov word ptr [bp - 2], ax                
  0b75:001d  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0021  8b4606           mov ax, word ptr [bp + 6]                
  0b75:0024  2689475d         mov word ptr es:[bx + 0x5d], ax          
  0b75:0028  8b46fe           mov ax, word ptr [bp - 2]                
  0b75:002b  eb00             jmp 0x2d                                 
  0b75:002d  c9               leave                                    
  0b75:002e  cb               retf                                     

proc_0b75_002f:
  0b75:002f  55               push bp                                  
  0b75:0030  8bec             mov bp, sp                               
  0b75:0032  9aa907a30a       lcall 0xaa3, 0x7a9                       -> 0aa3:07a9 [reloc]
  0b75:0037  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:003b  26ff775d         push word ptr es:[bx + 0x5d]             
  0b75:003f  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0043  8b4608           mov ax, word ptr [bp + 8]                
  0b75:0046  2603470a         add ax, word ptr es:[bx + 0xa]           
  0b75:004a  50               push ax                                  
  0b75:004b  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:004f  8b4606           mov ax, word ptr [bp + 6]                
  0b75:0052  26034708         add ax, word ptr es:[bx + 8]             
  0b75:0056  50               push ax                                  
  0b75:0057  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:005b  26ff7706         push word ptr es:[bx + 6]                
  0b75:005f  26ff7704         push word ptr es:[bx + 4]                
  0b75:0063  ff1ef215         lcall [0x15f2]                           
  0b75:0067  83c40a           add sp, 0xa                              
  0b75:006a  9a5b07a30a       lcall 0xaa3, 0x75b                       -> 0aa3:075b [reloc]
  0b75:006f  5d               pop bp                                   
  0b75:0070  cb               retf                                     

proc_0b75_0071:
  0b75:0071  55               push bp                                  
  0b75:0072  8bec             mov bp, sp                               
  0b75:0074  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0078  26ff775d         push word ptr es:[bx + 0x5d]             
  0b75:007c  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0080  8b4608           mov ax, word ptr [bp + 8]                
  0b75:0083  2603470a         add ax, word ptr es:[bx + 0xa]           
  0b75:0087  50               push ax                                  
  0b75:0088  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:008c  8b4606           mov ax, word ptr [bp + 6]                
  0b75:008f  26034708         add ax, word ptr es:[bx + 8]             
  0b75:0093  50               push ax                                  
  0b75:0094  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0098  26ff7706         push word ptr es:[bx + 6]                
  0b75:009c  26ff7704         push word ptr es:[bx + 4]                
  0b75:00a0  ff1ef215         lcall [0x15f2]                           
  0b75:00a4  83c40a           add sp, 0xa                              
  0b75:00a7  5d               pop bp                                   
  0b75:00a8  cb               retf                                     

proc_0b75_00a9:
  0b75:00a9  55               push bp                                  
  0b75:00aa  8bec             mov bp, sp                               
  0b75:00ac  9aa907a30a       lcall 0xaa3, 0x7a9                       -> 0aa3:07a9 [reloc]
  0b75:00b1  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:00b5  8b4610           mov ax, word ptr [bp + 0x10]             
  0b75:00b8  2603470a         add ax, word ptr es:[bx + 0xa]           
  0b75:00bc  50               push ax                                  
  0b75:00bd  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:00c1  8b460e           mov ax, word ptr [bp + 0xe]              
  0b75:00c4  26034708         add ax, word ptr es:[bx + 8]             
  0b75:00c8  50               push ax                                  
  0b75:00c9  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:00cd  26ff7706         push word ptr es:[bx + 6]                
  0b75:00d1  26ff7704         push word ptr es:[bx + 4]                
  0b75:00d5  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:00d8  26ff7706         push word ptr es:[bx + 6]                
  0b75:00dc  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:00df  26ff7704         push word ptr es:[bx + 4]                
  0b75:00e3  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:00e6  26ff7702         push word ptr es:[bx + 2]                
  0b75:00ea  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:00ed  26ff37           push word ptr es:[bx]                    
  0b75:00f0  ff7608           push word ptr [bp + 8]                   
  0b75:00f3  ff7606           push word ptr [bp + 6]                   
  0b75:00f6  ff1ef615         lcall [0x15f6]                           
  0b75:00fa  83c414           add sp, 0x14                             
  0b75:00fd  9a5b07a30a       lcall 0xaa3, 0x75b                       -> 0aa3:075b [reloc]
  0b75:0102  5d               pop bp                                   
  0b75:0103  cb               retf                                     

proc_0b75_0104:
  0b75:0104  55               push bp                                  
  0b75:0105  8bec             mov bp, sp                               
  0b75:0107  56               push si                                  
  0b75:0108  57               push di                                  
  0b75:0109  8b760e           mov si, word ptr [bp + 0xe]              
  0b75:010c  8b7e10           mov di, word ptr [bp + 0x10]             
  0b75:010f  9aa907a30a       lcall 0xaa3, 0x7a9                       -> 0aa3:07a9 [reloc]
  0b75:0114  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0118  26037708         add si, word ptr es:[bx + 8]             
  0b75:011c  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0120  26037f0a         add di, word ptr es:[bx + 0xa]           
  0b75:0124  833ea20600       cmp word ptr [0x6a2], 0                  
  0b75:0129  7503             jne 0x12e                                
  0b75:012b  e91201           jmp 0x240                                
  0b75:012e  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:0131  26ff7706         push word ptr es:[bx + 6]                
  0b75:0135  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:0138  268b4704         mov ax, word ptr es:[bx + 4]             
  0b75:013c  051e00           add ax, 0x1e                             
  0b75:013f  50               push ax                                  
  0b75:0140  1e               push ds                                  
  0b75:0141  681c0a           push 0xa1c                               
  0b75:0144  9a7c023d08       lcall 0x83d, 0x27c                       -> 083d:027c [reloc]
  0b75:0149  83c408           add sp, 8                                
  0b75:014c  6a00             push 0                                   
  0b75:014e  1e               push ds                                  
  0b75:014f  681c0a           push 0xa1c                               
  0b75:0152  9a4a083d08       lcall 0x83d, 0x84a                       -> 083d:084a [reloc]
  0b75:0157  83c406           add sp, 6                                
  0b75:015a  6a00             push 0                                   
  0b75:015c  8bc6             mov ax, si                               
  0b75:015e  250f00           and ax, 0xf                              
  0b75:0161  50               push ax                                  
  0b75:0162  1e               push ds                                  
  0b75:0163  681c0a           push 0xa1c                               
  0b75:0166  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:0169  26ff7706         push word ptr es:[bx + 6]                
  0b75:016d  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:0170  26ff7704         push word ptr es:[bx + 4]                
  0b75:0174  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:0177  26ff7702         push word ptr es:[bx + 2]                
  0b75:017b  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:017e  26ff37           push word ptr es:[bx]                    
  0b75:0181  ff7608           push word ptr [bp + 8]                   
  0b75:0184  ff7606           push word ptr [bp + 6]                   
  0b75:0187  ff1ef615         lcall [0x15f6]                           
  0b75:018b  83c414           add sp, 0x14                             
  0b75:018e  c45e12           les bx, ptr [bp + 0x12]                  
  0b75:0191  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0b75:0195  b400             mov ah, 0                                
  0b75:0197  50               push ax                                  
  0b75:0198  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:019b  26ff7706         push word ptr es:[bx + 6]                
  0b75:019f  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:01a2  268b4704         mov ax, word ptr es:[bx + 4]             
  0b75:01a6  051e00           add ax, 0x1e                             
  0b75:01a9  50               push ax                                  
  0b75:01aa  1e               push ds                                  
  0b75:01ab  68570a           push 0xa57                               
  0b75:01ae  9ab0023d08       lcall 0x83d, 0x2b0                       -> 083d:02b0 [reloc]
  0b75:01b3  83c40a           add sp, 0xa                              
  0b75:01b6  6a0f             push 0xf                                 
  0b75:01b8  1e               push ds                                  
  0b75:01b9  68570a           push 0xa57                               
  0b75:01bc  9a4a083d08       lcall 0x83d, 0x84a                       -> 083d:084a [reloc]
  0b75:01c1  83c406           add sp, 6                                
  0b75:01c4  6a00             push 0                                   
  0b75:01c6  8bc6             mov ax, si                               
  0b75:01c8  250f00           and ax, 0xf                              
  0b75:01cb  50               push ax                                  
  0b75:01cc  1e               push ds                                  
  0b75:01cd  68570a           push 0xa57                               
  0b75:01d0  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:01d3  26ff7706         push word ptr es:[bx + 6]                
  0b75:01d7  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:01da  26ff7704         push word ptr es:[bx + 4]                
  0b75:01de  ff7618           push word ptr [bp + 0x18]                
  0b75:01e1  ff7616           push word ptr [bp + 0x16]                
  0b75:01e4  ff7614           push word ptr [bp + 0x14]                
  0b75:01e7  ff7612           push word ptr [bp + 0x12]                
  0b75:01ea  ff1ef615         lcall [0x15f6]                           
  0b75:01ee  83c414           add sp, 0x14                             
  0b75:01f1  6a00             push 0                                   
  0b75:01f3  6a00             push 0                                   
  0b75:01f5  1e               push ds                                  
  0b75:01f6  68570a           push 0xa57                               
  0b75:01f9  57               push di                                  
  0b75:01fa  8bc6             mov ax, si                               
  0b75:01fc  25f0ff           and ax, 0xfff0                           
  0b75:01ff  50               push ax                                  
  0b75:0200  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0204  26ff7706         push word ptr es:[bx + 6]                
  0b75:0208  26ff7704         push word ptr es:[bx + 4]                
  0b75:020c  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:020f  26ff7706         push word ptr es:[bx + 6]                
  0b75:0213  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:0216  268b4704         mov ax, word ptr es:[bx + 4]             
  0b75:021a  051e00           add ax, 0x1e                             
  0b75:021d  50               push ax                                  
  0b75:021e  6a00             push 0                                   
  0b75:0220  6a00             push 0                                   
  0b75:0222  1e               push ds                                  
  0b75:0223  681c0a           push 0xa1c                               
  0b75:0226  ff1eea15         lcall [0x15ea]                           
  0b75:022a  83c41c           add sp, 0x1c                             
  0b75:022d  1e               push ds                                  
  0b75:022e  681c0a           push 0xa1c                               
  0b75:0231  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0b75:0236  83c404           add sp, 4                                
  0b75:0239  1e               push ds                                  
  0b75:023a  68570a           push 0xa57                               
  0b75:023d  e9a000           jmp 0x2e0                                
  0b75:0240  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:0243  26ff7706         push word ptr es:[bx + 6]                
  0b75:0247  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:024a  268b4704         mov ax, word ptr es:[bx + 4]             
  0b75:024e  051e00           add ax, 0x1e                             
  0b75:0251  50               push ax                                  
  0b75:0252  1e               push ds                                  
  0b75:0253  681c0a           push 0xa1c                               
  0b75:0256  9a7c023d08       lcall 0x83d, 0x27c                       -> 083d:027c [reloc]
  0b75:025b  83c408           add sp, 8                                
  0b75:025e  6a00             push 0                                   
  0b75:0260  1e               push ds                                  
  0b75:0261  681c0a           push 0xa1c                               
  0b75:0264  9a4a083d08       lcall 0x83d, 0x84a                       -> 083d:084a [reloc]
  0b75:0269  83c406           add sp, 6                                
  0b75:026c  6a00             push 0                                   
  0b75:026e  8bc6             mov ax, si                               
  0b75:0270  250f00           and ax, 0xf                              
  0b75:0273  50               push ax                                  
  0b75:0274  1e               push ds                                  
  0b75:0275  681c0a           push 0xa1c                               
  0b75:0278  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:027b  26ff7706         push word ptr es:[bx + 6]                
  0b75:027f  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:0282  26ff7704         push word ptr es:[bx + 4]                
  0b75:0286  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:0289  26ff7702         push word ptr es:[bx + 2]                
  0b75:028d  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:0290  26ff37           push word ptr es:[bx]                    
  0b75:0293  ff7608           push word ptr [bp + 8]                   
  0b75:0296  ff7606           push word ptr [bp + 6]                   
  0b75:0299  ff1ef615         lcall [0x15f6]                           
  0b75:029d  83c414           add sp, 0x14                             
  0b75:02a0  6a00             push 0                                   
  0b75:02a2  6a00             push 0                                   
  0b75:02a4  6a00             push 0                                   
  0b75:02a6  6a00             push 0                                   
  0b75:02a8  57               push di                                  
  0b75:02a9  8bc6             mov ax, si                               
  0b75:02ab  25f0ff           and ax, 0xfff0                           
  0b75:02ae  50               push ax                                  
  0b75:02af  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:02b3  26ff7706         push word ptr es:[bx + 6]                
  0b75:02b7  26ff7704         push word ptr es:[bx + 4]                
  0b75:02bb  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:02be  26ff7706         push word ptr es:[bx + 6]                
  0b75:02c2  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:02c5  268b4704         mov ax, word ptr es:[bx + 4]             
  0b75:02c9  051e00           add ax, 0x1e                             
  0b75:02cc  50               push ax                                  
  0b75:02cd  6a00             push 0                                   
  0b75:02cf  6a00             push 0                                   
  0b75:02d1  1e               push ds                                  
  0b75:02d2  681c0a           push 0xa1c                               
  0b75:02d5  ff1eea15         lcall [0x15ea]                           
  0b75:02d9  83c41c           add sp, 0x1c                             
  0b75:02dc  1e               push ds                                  
  0b75:02dd  681c0a           push 0xa1c                               
  0b75:02e0  9af3093d08       lcall 0x83d, 0x9f3                       -> 083d:09f3 [reloc]
  0b75:02e5  83c404           add sp, 4                                
  0b75:02e8  9a5b07a30a       lcall 0xaa3, 0x75b                       -> 0aa3:075b [reloc]
  0b75:02ed  5f               pop di                                   
  0b75:02ee  5e               pop si                                   
  0b75:02ef  5d               pop bp                                   
  0b75:02f0  cb               retf                                     

proc_0b75_02f1:
  0b75:02f1  55               push bp                                  
  0b75:02f2  8bec             mov bp, sp                               
  0b75:02f4  56               push si                                  
  0b75:02f5  57               push di                                  
  0b75:02f6  8b7e0a           mov di, word ptr [bp + 0xa]              
  0b75:02f9  8b760c           mov si, word ptr [bp + 0xc]              
  0b75:02fc  9aa907a30a       lcall 0xaa3, 0x7a9                       -> 0aa3:07a9 [reloc]
  0b75:0301  3bfe             cmp di, si                               
  0b75:0303  7f03             jg 0x308                                 
  0b75:0305  e99000           jmp 0x398                                
  0b75:0308  56               push si                                  
  0b75:0309  0e               push cs                                  
  0b75:030a  e801fd           call 0xe                                 -> 0b75:000e
  0b75:030d  59               pop cx                                   
  0b75:030e  c45e06           les bx, ptr [bp + 6]                     
  0b75:0311  26ff7706         push word ptr es:[bx + 6]                
  0b75:0315  c45e06           les bx, ptr [bp + 6]                     
  0b75:0318  26ff7702         push word ptr es:[bx + 2]                
  0b75:031c  c45e06           les bx, ptr [bp + 6]                     
  0b75:031f  06               push es                                  
  0b75:0320  c47606           les si, ptr [bp + 6]                     
  0b75:0323  268b04           mov ax, word ptr es:[si]                 
  0b75:0326  07               pop es                                   
  0b75:0327  26034704         add ax, word ptr es:[bx + 4]             
  0b75:032b  48               dec ax                                   
  0b75:032c  50               push ax                                  
  0b75:032d  9a42036609       lcall 0x966, 0x342                       -> 0966:0342 [reloc]
  0b75:0332  83c406           add sp, 6                                
  0b75:0335  c45e06           les bx, ptr [bp + 6]                     
  0b75:0338  26ff7704         push word ptr es:[bx + 4]                
  0b75:033c  c45e06           les bx, ptr [bp + 6]                     
  0b75:033f  268b4702         mov ax, word ptr es:[bx + 2]             
  0b75:0343  c45e06           les bx, ptr [bp + 6]                     
  0b75:0346  26034706         add ax, word ptr es:[bx + 6]             
  0b75:034a  48               dec ax                                   
  0b75:034b  50               push ax                                  
  0b75:034c  c45e06           les bx, ptr [bp + 6]                     
  0b75:034f  26ff37           push word ptr es:[bx]                    
  0b75:0352  9afc026609       lcall 0x966, 0x2fc                       -> 0966:02fc [reloc]
  0b75:0357  83c406           add sp, 6                                
  0b75:035a  57               push di                                  
  0b75:035b  0e               push cs                                  
  0b75:035c  e8affc           call 0xe                                 -> 0b75:000e
  0b75:035f  59               pop cx                                   
  0b75:0360  c45e06           les bx, ptr [bp + 6]                     
  0b75:0363  26ff7704         push word ptr es:[bx + 4]                
  0b75:0367  c45e06           les bx, ptr [bp + 6]                     
  0b75:036a  26ff7702         push word ptr es:[bx + 2]                
  0b75:036e  c45e06           les bx, ptr [bp + 6]                     
  0b75:0371  26ff37           push word ptr es:[bx]                    
  0b75:0374  9afc026609       lcall 0x966, 0x2fc                       -> 0966:02fc [reloc]
  0b75:0379  83c406           add sp, 6                                
  0b75:037c  c45e06           les bx, ptr [bp + 6]                     
  0b75:037f  26ff7706         push word ptr es:[bx + 6]                
  0b75:0383  c45e06           les bx, ptr [bp + 6]                     
  0b75:0386  26ff7702         push word ptr es:[bx + 2]                
  0b75:038a  c45e06           les bx, ptr [bp + 6]                     
  0b75:038d  26ff37           push word ptr es:[bx]                    
  0b75:0390  9a42036609       lcall 0x966, 0x342                       -> 0966:0342 [reloc]
  0b75:0395  e98d00           jmp 0x425                                
  0b75:0398  57               push di                                  
  0b75:0399  0e               push cs                                  
  0b75:039a  e871fc           call 0xe                                 -> 0b75:000e
  0b75:039d  59               pop cx                                   
  0b75:039e  c45e06           les bx, ptr [bp + 6]                     
  0b75:03a1  26ff7704         push word ptr es:[bx + 4]                
  0b75:03a5  c45e06           les bx, ptr [bp + 6]                     
  0b75:03a8  26ff7702         push word ptr es:[bx + 2]                
  0b75:03ac  c45e06           les bx, ptr [bp + 6]                     
  0b75:03af  26ff37           push word ptr es:[bx]                    
  0b75:03b2  9afc026609       lcall 0x966, 0x2fc                       -> 0966:02fc [reloc]
  0b75:03b7  83c406           add sp, 6                                
  0b75:03ba  c45e06           les bx, ptr [bp + 6]                     
  0b75:03bd  26ff7706         push word ptr es:[bx + 6]                
  0b75:03c1  c45e06           les bx, ptr [bp + 6]                     
  0b75:03c4  26ff7702         push word ptr es:[bx + 2]                
  0b75:03c8  c45e06           les bx, ptr [bp + 6]                     
  0b75:03cb  26ff37           push word ptr es:[bx]                    
  0b75:03ce  9a42036609       lcall 0x966, 0x342                       -> 0966:0342 [reloc]
  0b75:03d3  83c406           add sp, 6                                
  0b75:03d6  56               push si                                  
  0b75:03d7  0e               push cs                                  
  0b75:03d8  e833fc           call 0xe                                 -> 0b75:000e
  0b75:03db  59               pop cx                                   
  0b75:03dc  c45e06           les bx, ptr [bp + 6]                     
  0b75:03df  26ff7706         push word ptr es:[bx + 6]                
  0b75:03e3  c45e06           les bx, ptr [bp + 6]                     
  0b75:03e6  26ff7702         push word ptr es:[bx + 2]                
  0b75:03ea  c45e06           les bx, ptr [bp + 6]                     
  0b75:03ed  06               push es                                  
  0b75:03ee  c47606           les si, ptr [bp + 6]                     
  0b75:03f1  268b04           mov ax, word ptr es:[si]                 
  0b75:03f4  07               pop es                                   
  0b75:03f5  26034704         add ax, word ptr es:[bx + 4]             
  0b75:03f9  48               dec ax                                   
  0b75:03fa  50               push ax                                  
  0b75:03fb  9a42036609       lcall 0x966, 0x342                       -> 0966:0342 [reloc]
  0b75:0400  83c406           add sp, 6                                
  0b75:0403  c45e06           les bx, ptr [bp + 6]                     
  0b75:0406  26ff7704         push word ptr es:[bx + 4]                
  0b75:040a  c45e06           les bx, ptr [bp + 6]                     
  0b75:040d  268b4702         mov ax, word ptr es:[bx + 2]             
  0b75:0411  c45e06           les bx, ptr [bp + 6]                     
  0b75:0414  26034706         add ax, word ptr es:[bx + 6]             
  0b75:0418  48               dec ax                                   
  0b75:0419  50               push ax                                  
  0b75:041a  c45e06           les bx, ptr [bp + 6]                     
  0b75:041d  26ff37           push word ptr es:[bx]                    
  0b75:0420  9afc026609       lcall 0x966, 0x2fc                       -> 0966:02fc [reloc]
  0b75:0425  83c406           add sp, 6                                
  0b75:0428  9a5b07a30a       lcall 0xaa3, 0x75b                       -> 0aa3:075b [reloc]
  0b75:042d  5f               pop di                                   
  0b75:042e  5e               pop si                                   
  0b75:042f  5d               pop bp                                   
  0b75:0430  cb               retf                                     
  0b75:0431  c8080000         enter 8, 0                               
  0b75:0435  56               push si                                  
  0b75:0436  6a08             push 8                                   
  0b75:0438  ff7608           push word ptr [bp + 8]                   
  0b75:043b  ff7606           push word ptr [bp + 6]                   
  0b75:043e  16               push ss                                  
  0b75:043f  8d46f8           lea ax, [bp - 8]                         
  0b75:0442  50               push ax                                  
  0b75:0443  9ae43f0000       lcall 0, 0x3fe4                          -> 0000:3fe4 [reloc]
  0b75:0448  83c40a           add sp, 0xa                              
  0b75:044b  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:044f  06               push es                                  
  0b75:0450  c47606           les si, ptr [bp + 6]                     
  0b75:0453  268b04           mov ax, word ptr es:[si]                 
  0b75:0456  07               pop es                                   
  0b75:0457  26034708         add ax, word ptr es:[bx + 8]             
  0b75:045b  8946f8           mov word ptr [bp - 8], ax                
  0b75:045e  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0462  06               push es                                  
  0b75:0463  c47606           les si, ptr [bp + 6]                     
  0b75:0466  268b04           mov ax, word ptr es:[si]                 
  0b75:0469  07               pop es                                   
  0b75:046a  2603470a         add ax, word ptr es:[bx + 0xa]           
  0b75:046e  8946fa           mov word ptr [bp - 6], ax                
  0b75:0471  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0475  06               push es                                  
  0b75:0476  c47606           les si, ptr [bp + 6]                     
  0b75:0479  268b04           mov ax, word ptr es:[si]                 
  0b75:047c  07               pop es                                   
  0b75:047d  26034708         add ax, word ptr es:[bx + 8]             
  0b75:0481  8946f8           mov word ptr [bp - 8], ax                
  0b75:0484  ff760a           push word ptr [bp + 0xa]                 
  0b75:0487  16               push ss                                  
  0b75:0488  8d46f8           lea ax, [bp - 8]                         
  0b75:048b  50               push ax                                  
  0b75:048c  c41e5b1a         les bx, ptr [0x1a5b]                     
  0b75:0490  26ff7706         push word ptr es:[bx + 6]                
  0b75:0494  26ff7704         push word ptr es:[bx + 4]                
  0b75:0498  9acd043d08       lcall 0x83d, 0x4cd                       -> 083d:04cd [reloc]
  0b75:049d  83c40a           add sp, 0xa                              
  0b75:04a0  5e               pop si                                   
  0b75:04a1  c9               leave                                    
  0b75:04a2  cb               retf                                     

proc_0b75_04a3:
  0b75:04a3  55               push bp                                  
  0b75:04a4  8bec             mov bp, sp                               
  0b75:04a6  56               push si                                  
  0b75:04a7  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:04aa  268b7702         mov si, word ptr es:[bx + 2]             
  0b75:04ae  eb20             jmp 0x4d0                                
  0b75:04b0  ff760e           push word ptr [bp + 0xe]                 
  0b75:04b3  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:04b6  26ff7704         push word ptr es:[bx + 4]                
  0b75:04ba  56               push si                                  
  0b75:04bb  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:04be  26ff37           push word ptr es:[bx]                    
  0b75:04c1  ff7608           push word ptr [bp + 8]                   
  0b75:04c4  ff7606           push word ptr [bp + 6]                   
  0b75:04c7  9a350c3d08       lcall 0x83d, 0xc35                       -> 083d:0c35 [reloc]
  0b75:04cc  83c40c           add sp, 0xc                              
  0b75:04cf  46               inc si                                   
  0b75:04d0  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:04d3  268b4702         mov ax, word ptr es:[bx + 2]             
  0b75:04d7  c45e0a           les bx, ptr [bp + 0xa]                   
  0b75:04da  26034706         add ax, word ptr es:[bx + 6]             
  0b75:04de  3bc6             cmp ax, si                               
