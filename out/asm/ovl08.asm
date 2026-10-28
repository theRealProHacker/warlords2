; ovl08 stub 2f80 file_off 0x42490 size 0x245

ovl08_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec02           sub sp, 2                                
  0006  56               push si                                  
  0007  666a03           push 3                                   
  000a  6a01             push 1                                   
  000c  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0011  83c406           add sp, 6                                
  0014  8946fe           mov word ptr [bp - 2], ax                
  0017  33f6             xor si, si                               
  0019  eb06             jmp 0x21                                 
  001b  90               nop                                      
  001c  0e               push cs                                  
  001d  e8ea00           call 0x10a                               
  0020  46               inc si                                   
  0021  3b76fe           cmp si, word ptr [bp - 2]                
  0024  7cf5             jl 0x1b                                  
  0026  5e               pop si                                   
  0027  c9               leave                                    
  0028  cb               retf                                     

ovl08_0029:  ; ENTRY
  0029  55               push bp                                  
  002a  8bec             mov bp, sp                               
  002c  83ec06           sub sp, 6                                
  002f  56               push si                                  
  0030  666805000300     push 0x30005                             
  0036  6a01             push 1                                   
  0038  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  003d  83c406           add sp, 6                                
  0040  8946fe           mov word ptr [bp - 2], ax                
  0043  33f6             xor si, si                               
  0045  e9b700           jmp 0xff                                 
  0048  666a03           push 3                                   
  004b  6a01             push 1                                   
  004d  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0052  83c406           add sp, 6                                
  0055  50               push ax                                  
  0056  66680800ffff     push 0xffff0008                          
  005c  6a01             push 1                                   
  005e  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0063  83c406           add sp, 6                                
  0066  c1e002           shl ax, 2                                
  0069  c41e8a3f         les bx, ptr [0x3f8a]                     
  006d  03d8             add bx, ax                               
  006f  58               pop ax                                   
  0070  26f7afbc00       imul word ptr es:[bx + 0xbc]             
  0075  8b5606           mov dx, word ptr [bp + 6]                
  0078  03d0             add dx, ax                               
  007a  8956fc           mov word ptr [bp - 4], dx                
  007d  666a03           push 3                                   
  0080  6a01             push 1                                   
  0082  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0087  83c406           add sp, 6                                
  008a  50               push ax                                  
  008b  66680800ffff     push 0xffff0008                          
  0091  6a01             push 1                                   
  0093  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0098  83c406           add sp, 6                                
  009b  c1e002           shl ax, 2                                
  009e  c41e8a3f         les bx, ptr [0x3f8a]                     
  00a2  03d8             add bx, ax                               
  00a4  58               pop ax                                   
  00a5  26f7afbe00       imul word ptr es:[bx + 0xbe]             
  00aa  8b5608           mov dx, word ptr [bp + 8]                
  00ad  03d0             add dx, ax                               
  00af  8956fa           mov word ptr [bp - 6], dx                
  00b2  16               push ss                                  
  00b3  8d46fa           lea ax, [bp - 6]                         
  00b6  50               push ax                                  
  00b7  16               push ss                                  
  00b8  8d46fc           lea ax, [bp - 4]                         
  00bb  50               push ax                                  
  00bc  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  00c1  83c408           add sp, 8                                
  00c4  8b46fa           mov ax, word ptr [bp - 6]                
  00c7  6bc070           imul ax, ax, 0x70                        
  00ca  c41e8a3f         les bx, ptr [0x3f8a]                     
  00ce  03d8             add bx, ax                               
  00d0  035efc           add bx, word ptr [bp - 4]                
  00d3  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  00d9  7523             jne 0xfe                                 
  00db  8b46fa           mov ax, word ptr [bp - 6]                
  00de  6bc070           imul ax, ax, 0x70                        
  00e1  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  00e5  03d8             add bx, ax                               
  00e7  035efc           add bx, word ptr [bp - 4]                
  00ea  26c687206108     mov byte ptr es:[bx + 0x6120], 8         
  00f0  ff76fa           push word ptr [bp - 6]                   
  00f3  ff76fc           push word ptr [bp - 4]                   
  00f6  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  00fb  83c404           add sp, 4                                
  00fe  46               inc si                                   
  00ff  3b76fe           cmp si, word ptr [bp - 2]                
  0102  7d03             jge 0x107                                
  0104  e941ff           jmp 0x48                                 
  0107  5e               pop si                                   
  0108  c9               leave                                    
  0109  cb               retf                                     

ovl08_010a:  ; ENTRY
  010a  55               push bp                                  
  010b  8bec             mov bp, sp                               
  010d  83ec06           sub sp, 6                                
  0110  56               push si                                  
  0111  57               push di                                  
  0112  c746fe0000       mov word ptr [bp - 2], 0                 
  0117  c746fc0000       mov word ptr [bp - 4], 0                 
  011c  e9b700           jmp 0x1d6                                
  011f  c746fa0000       mov word ptr [bp - 6], 0                 
  0124  666866000500     push 0x50066                             
  012a  6a01             push 1                                   
  012c  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0131  83c406           add sp, 6                                
  0134  8bf0             mov si, ax                               
  0136  666892000500     push 0x50092                             
  013c  6a01             push 1                                   
  013e  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0143  83c406           add sp, 6                                
  0146  8bf8             mov di, ax                               
  0148  6bc070           imul ax, ax, 0x70                        
  014b  c41e8a3f         les bx, ptr [0x3f8a]                     
  014f  03d8             add bx, ax                               
  0151  03de             add bx, si                               
  0153  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0159  7505             jne 0x160                                
  015b  c746fa0100       mov word ptr [bp - 6], 1                 
  0160  837efa00         cmp word ptr [bp - 6], 0                 
  0164  7470             je 0x1d6                                 
  0166  837efe04         cmp word ptr [bp - 2], 4                 
  016a  7d65             jge 0x1d1                                
  016c  6a03             push 3                                   
  016e  57               push di                                  
  016f  56               push si                                  
  0170  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  0175  83c406           add sp, 6                                
  0178  0bc0             or ax, ax                                
  017a  7405             je 0x181                                 
  017c  c746fc0100       mov word ptr [bp - 4], 1                 
  0181  6a03             push 3                                   
  0183  57               push di                                  
  0184  8bc6             mov ax, si                               
  0186  40               inc ax                                   
  0187  50               push ax                                  
  0188  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  018d  83c406           add sp, 6                                
  0190  0bc0             or ax, ax                                
  0192  7405             je 0x199                                 
  0194  c746fc0100       mov word ptr [bp - 4], 1                 
  0199  6a03             push 3                                   
  019b  8bc7             mov ax, di                               
  019d  40               inc ax                                   
  019e  50               push ax                                  
  019f  56               push si                                  
  01a0  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  01a5  83c406           add sp, 6                                
  01a8  0bc0             or ax, ax                                
  01aa  7405             je 0x1b1                                 
  01ac  c746fc0100       mov word ptr [bp - 4], 1                 
  01b1  6a03             push 3                                   
  01b3  8bc7             mov ax, di                               
  01b5  40               inc ax                                   
  01b6  50               push ax                                  
  01b7  8bc6             mov ax, si                               
  01b9  40               inc ax                                   
  01ba  50               push ax                                  
  01bb  9a3400672f       lcall 0x2f67, 0x34                       -> ovl03:11f5
  01c0  83c406           add sp, 6                                
  01c3  0bc0             or ax, ax                                
  01c5  7405             je 0x1cc                                 
  01c7  c746fc0100       mov word ptr [bp - 4], 1                 
  01cc  ff46fe           inc word ptr [bp - 2]                    
  01cf  eb05             jmp 0x1d6                                
  01d1  c746fc0100       mov word ptr [bp - 4], 1                 
  01d6  837efc00         cmp word ptr [bp - 4], 0                 
  01da  7503             jne 0x1df                                
  01dc  e940ff           jmp 0x11f                                
  01df  8bc7             mov ax, di                               
  01e1  6bc070           imul ax, ax, 0x70                        
  01e4  c41e8a3f         les bx, ptr [0x3f8a]                     
  01e8  03d8             add bx, ax                               
  01ea  03de             add bx, si                               
  01ec  26c687206108     mov byte ptr es:[bx + 0x6120], 8         
  01f2  57               push di                                  
  01f3  56               push si                                  
  01f4  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  01f9  83c404           add sp, 4                                
  01fc  57               push di                                  
  01fd  56               push si                                  
  01fe  0e               push cs                                  
  01ff  e827fe           call 0x29                                
  0202  83c404           add sp, 4                                
  0205  8bc7             mov ax, di                               
  0207  40               inc ax                                   
  0208  50               push ax                                  
  0209  8bc6             mov ax, si                               
  020b  40               inc ax                                   
  020c  50               push ax                                  
  020d  0e               push cs                                  
  020e  e818fe           call 0x29                                
  0211  83c404           add sp, 4                                
  0214  8bc7             mov ax, di                               
  0216  48               dec ax                                   
  0217  50               push ax                                  
  0218  8bc6             mov ax, si                               
  021a  48               dec ax                                   
  021b  50               push ax                                  
  021c  0e               push cs                                  
  021d  e809fe           call 0x29                                
  0220  83c404           add sp, 4                                
  0223  8bc7             mov ax, di                               
  0225  40               inc ax                                   
  0226  50               push ax                                  
  0227  8bc6             mov ax, si                               
  0229  48               dec ax                                   
  022a  50               push ax                                  
  022b  0e               push cs                                  
  022c  e8fafd           call 0x29                                
  022f  83c404           add sp, 4                                
  0232  8bc7             mov ax, di                               
  0234  48               dec ax                                   
  0235  50               push ax                                  
  0236  8bc6             mov ax, si                               
  0238  40               inc ax                                   
  0239  50               push ax                                  
  023a  0e               push cs                                  
  023b  e8ebfd           call 0x29                                
  023e  83c404           add sp, 4                                
  0241  5f               pop di                                   
  0242  5e               pop si                                   
  0243  c9               leave                                    
  0244  cb               retf                                     
