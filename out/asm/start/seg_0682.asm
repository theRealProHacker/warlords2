; seg 0682  img 0x6820..0x6a90  file off 0x7420
  0682:0000  c6               db c6
  0682:0001  7fdb             jg 0xffffffde                            
  0682:0003  b80100           mov ax, 1                                
  0682:0006  5f               pop di                                   
  0682:0007  5e               pop si                                   
  0682:0008  c9               leave                                    
  0682:0009  cb               retf                                     
  0682:000a  bada03           mov dx, 0x3da                            
  0682:000d  ec               in al, dx                                
  0682:000e  a808             test al, 8                               
  0682:0010  74fb             je 0xd                                   
  0682:0012  ec               in al, dx                                
  0682:0013  a808             test al, 8                               
  0682:0015  75fb             jne 0x12                                 
  0682:0017  cb               retf                                     

proc_0682_0018:
  0682:0018  55               push bp                                  
  0682:0019  8bec             mov bp, sp                               
  0682:001b  8b4e06           mov cx, word ptr [bp + 6]                
  0682:001e  8ac1             mov al, cl                               
  0682:0020  52               push dx                                  
  0682:0021  bace03           mov dx, 0x3ce                            
  0682:0024  8ae0             mov ah, al                               
  0682:0026  b004             mov al, 4                                
  0682:0028  ef               out dx, ax                               
  0682:0029  5a               pop dx                                   
  0682:002a  b001             mov al, 1                                
  0682:002c  d2e0             shl al, cl                               
  0682:002e  52               push dx                                  
  0682:002f  bac403           mov dx, 0x3c4                            
  0682:0032  8ae0             mov ah, al                               
  0682:0034  b002             mov al, 2                                
  0682:0036  ef               out dx, ax                               
  0682:0037  5a               pop dx                                   
  0682:0038  5d               pop bp                                   
  0682:0039  cb               retf                                     
  0682:003a  b00f             mov al, 0xf                              
  0682:003c  52               push dx                                  
  0682:003d  bac403           mov dx, 0x3c4                            
  0682:0040  8ae0             mov ah, al                               
  0682:0042  b002             mov al, 2                                
  0682:0044  ef               out dx, ax                               
  0682:0045  5a               pop dx                                   
  0682:0046  cb               retf                                     

proc_0682_0047:
  0682:0047  55               push bp                                  
  0682:0048  8bec             mov bp, sp                               
  0682:004a  8b4606           mov ax, word ptr [bp + 6]                
  0682:004d  52               push dx                                  
  0682:004e  bace03           mov dx, 0x3ce                            
  0682:0051  8ae0             mov ah, al                               
  0682:0053  b005             mov al, 5                                
  0682:0055  ef               out dx, ax                               
  0682:0056  5a               pop dx                                   
  0682:0057  5d               pop bp                                   
  0682:0058  cb               retf                                     

proc_0682_0059:
  0682:0059  55               push bp                                  
  0682:005a  8bec             mov bp, sp                               
  0682:005c  83ec08           sub sp, 8                                
  0682:005f  1e               push ds                                  
  0682:0060  06               push es                                  
  0682:0061  57               push di                                  
  0682:0062  56               push si                                  
  0682:0063  fc               cld                                      
  0682:0064  8b460c           mov ax, word ptr [bp + 0xc]              
  0682:0067  8ec0             mov es, ax                               
  0682:0069  8b7608           mov si, word ptr [bp + 8]                
  0682:006c  8b460a           mov ax, word ptr [bp + 0xa]              
  0682:006f  2b4612           sub ax, word ptr [bp + 0x12]             
  0682:0072  d1e0             shl ax, 1                                
  0682:0074  8946fe           mov word ptr [bp - 2], ax                
  0682:0077  8b461a           mov ax, word ptr [bp + 0x1a]             
  0682:007a  2b4612           sub ax, word ptr [bp + 0x12]             
  0682:007d  d1e0             shl ax, 1                                
  0682:007f  8946fc           mov word ptr [bp - 4], ax                
  0682:0082  8b4610           mov ax, word ptr [bp + 0x10]             
  0682:0085  2d0100           sub ax, 1                                
  0682:0088  d1e0             shl ax, 1                                
  0682:008a  05fa15           add ax, 0x15fa                           
  0682:008d  8946f8           mov word ptr [bp - 8], ax                
  0682:0090  8b5614           mov dx, word ptr [bp + 0x14]             
  0682:0093  8b4e06           mov cx, word ptr [bp + 6]                
  0682:0096  8ed9             mov ds, cx                               
  0682:0098  8b5ef8           mov bx, word ptr [bp - 8]                
  0682:009b  8b4e12           mov cx, word ptr [bp + 0x12]             
  0682:009e  8b7e0e           mov di, word ptr [bp + 0xe]              
  0682:00a1  8b5ef8           mov bx, word ptr [bp - 8]                
  0682:00a4  83c302           add bx, 2                                
  0682:00a7  895ef8           mov word ptr [bp - 8], bx                
  0682:00aa  b89e10           mov ax, 0x109e                            [reloc]
  0682:00ad  8ec0             mov es, ax                               
  0682:00af  26033f           add di, word ptr es:[bx]                 
  0682:00b2  8b4616           mov ax, word ptr [bp + 0x16]             
  0682:00b5  8ec0             mov es, ax                               
  0682:00b7  8b5e18           mov bx, word ptr [bp + 0x18]             
  0682:00ba  268b1f           mov bx, word ptr es:[bx]                 
  0682:00bd  8b460c           mov ax, word ptr [bp + 0xc]              
  0682:00c0  8ec0             mov es, ax                               
  0682:00c2  268b05           mov ax, word ptr es:[di]                 
  0682:00c5  23c3             and ax, bx                               
  0682:00c7  f7d3             not bx                                   
  0682:00c9  231c             and bx, word ptr [si]                    
  0682:00cb  0bc3             or ax, bx                                
  0682:00cd  268905           mov word ptr es:[di], ax                 
  0682:00d0  83461802         add word ptr [bp + 0x18], 2              
  0682:00d4  83c702           add di, 2                                
  0682:00d7  83c602           add si, 2                                
  0682:00da  e2d6             loop 0xb2                                
  0682:00dc  0376fe           add si, word ptr [bp - 2]                
  0682:00df  8b4618           mov ax, word ptr [bp + 0x18]             
  0682:00e2  0346fc           add ax, word ptr [bp - 4]                
  0682:00e5  894618           mov word ptr [bp + 0x18], ax             
  0682:00e8  4a               dec dx                                   
  0682:00e9  75b0             jne 0x9b                                 
  0682:00eb  5e               pop si                                   
  0682:00ec  5f               pop di                                   
  0682:00ed  07               pop es                                   
  0682:00ee  1f               pop ds                                   
  0682:00ef  8be5             mov sp, bp                               
  0682:00f1  5d               pop bp                                   
  0682:00f2  cb               retf                                     

proc_0682_00f3:
  0682:00f3  55               push bp                                  
  0682:00f4  8bec             mov bp, sp                               
  0682:00f6  83ec06           sub sp, 6                                
  0682:00f9  1e               push ds                                  
  0682:00fa  06               push es                                  
  0682:00fb  57               push di                                  
  0682:00fc  56               push si                                  
  0682:00fd  fc               cld                                      
  0682:00fe  8b460a           mov ax, word ptr [bp + 0xa]              
  0682:0101  2b4612           sub ax, word ptr [bp + 0x12]             
  0682:0104  d1e0             shl ax, 1                                
  0682:0106  8946fe           mov word ptr [bp - 2], ax                
  0682:0109  8b4610           mov ax, word ptr [bp + 0x10]             
  0682:010c  2b4612           sub ax, word ptr [bp + 0x12]             
  0682:010f  d1e0             shl ax, 1                                
  0682:0111  8946fc           mov word ptr [bp - 4], ax                
  0682:0114  8b461a           mov ax, word ptr [bp + 0x1a]             
  0682:0117  2b4612           sub ax, word ptr [bp + 0x12]             
  0682:011a  d1e0             shl ax, 1                                
  0682:011c  8946fa           mov word ptr [bp - 6], ax                
  0682:011f  8b7608           mov si, word ptr [bp + 8]                
  0682:0122  8b7e0e           mov di, word ptr [bp + 0xe]              
  0682:0125  8b5614           mov dx, word ptr [bp + 0x14]             
  0682:0128  8b4606           mov ax, word ptr [bp + 6]                
  0682:012b  8ed8             mov ds, ax                               
  0682:012d  8b4e12           mov cx, word ptr [bp + 0x12]             
  0682:0130  8b4616           mov ax, word ptr [bp + 0x16]             
  0682:0133  8ec0             mov es, ax                               
  0682:0135  8b5e18           mov bx, word ptr [bp + 0x18]             
  0682:0138  268b1f           mov bx, word ptr es:[bx]                 
  0682:013b  8b460c           mov ax, word ptr [bp + 0xc]              
  0682:013e  8ec0             mov es, ax                               
  0682:0140  268b05           mov ax, word ptr es:[di]                 
  0682:0143  23c3             and ax, bx                               
  0682:0145  f7d3             not bx                                   
  0682:0147  231c             and bx, word ptr [si]                    
  0682:0149  0bc3             or ax, bx                                
  0682:014b  268905           mov word ptr es:[di], ax                 
  0682:014e  83461802         add word ptr [bp + 0x18], 2              
  0682:0152  83c702           add di, 2                                
  0682:0155  83c602           add si, 2                                
  0682:0158  e2d6             loop 0x130                               
  0682:015a  0376fe           add si, word ptr [bp - 2]                
  0682:015d  037efc           add di, word ptr [bp - 4]                
  0682:0160  8b4618           mov ax, word ptr [bp + 0x18]             
  0682:0163  0346fa           add ax, word ptr [bp - 6]                
  0682:0166  894618           mov word ptr [bp + 0x18], ax             
  0682:0169  4a               dec dx                                   
  0682:016a  75c1             jne 0x12d                                
  0682:016c  5e               pop si                                   
  0682:016d  5f               pop di                                   
  0682:016e  07               pop es                                   
  0682:016f  1f               pop ds                                   
  0682:0170  8be5             mov sp, bp                               
  0682:0172  5d               pop bp                                   
  0682:0173  cb               retf                                     

proc_0682_0174:
  0682:0174  55               push bp                                  
  0682:0175  8bec             mov bp, sp                               
  0682:0177  83ec06           sub sp, 6                                
  0682:017a  1e               push ds                                  
  0682:017b  06               push es                                  
  0682:017c  57               push di                                  
  0682:017d  56               push si                                  
  0682:017e  fc               cld                                      
  0682:017f  8b460a           mov ax, word ptr [bp + 0xa]              
  0682:0182  2b4610           sub ax, word ptr [bp + 0x10]             
  0682:0185  d1e0             shl ax, 1                                
  0682:0187  8946fe           mov word ptr [bp - 2], ax                
  0682:018a  8b460e           mov ax, word ptr [bp + 0xe]              
  0682:018d  2b4610           sub ax, word ptr [bp + 0x10]             
  0682:0190  d1e0             shl ax, 1                                
  0682:0192  8946fc           mov word ptr [bp - 4], ax                
  0682:0195  8b4616           mov ax, word ptr [bp + 0x16]             
  0682:0198  2b4610           sub ax, word ptr [bp + 0x10]             
  0682:019b  d1e0             shl ax, 1                                
  0682:019d  8946fa           mov word ptr [bp - 6], ax                
  0682:01a0  8b7608           mov si, word ptr [bp + 8]                
  0682:01a3  8b7e0c           mov di, word ptr [bp + 0xc]              
  0682:01a6  8b5612           mov dx, word ptr [bp + 0x12]             
  0682:01a9  8b4606           mov ax, word ptr [bp + 6]                
  0682:01ac  8ed8             mov ds, ax                               
  0682:01ae  8b4e10           mov cx, word ptr [bp + 0x10]             
  0682:01b1  8b5e14           mov bx, word ptr [bp + 0x14]             
  0682:01b4  8b1f             mov bx, word ptr [bx]                    
  0682:01b6  8b05             mov ax, word ptr [di]                    
  0682:01b8  23c3             and ax, bx                               
  0682:01ba  f7d3             not bx                                   
  0682:01bc  231c             and bx, word ptr [si]                    
  0682:01be  0bc3             or ax, bx                                
  0682:01c0  8905             mov word ptr [di], ax                    
  0682:01c2  83461402         add word ptr [bp + 0x14], 2              
  0682:01c6  83c702           add di, 2                                
  0682:01c9  83c602           add si, 2                                
  0682:01cc  e2e3             loop 0x1b1                               
  0682:01ce  0376fe           add si, word ptr [bp - 2]                
  0682:01d1  037efc           add di, word ptr [bp - 4]                
  0682:01d4  8b4614           mov ax, word ptr [bp + 0x14]             
  0682:01d7  0346fa           add ax, word ptr [bp - 6]                
  0682:01da  894614           mov word ptr [bp + 0x14], ax             
  0682:01dd  4a               dec dx                                   
  0682:01de  75ce             jne 0x1ae                                
  0682:01e0  5e               pop si                                   
  0682:01e1  5f               pop di                                   
  0682:01e2  07               pop es                                   
  0682:01e3  1f               pop ds                                   
  0682:01e4  8be5             mov sp, bp                               
  0682:01e6  5d               pop bp                                   
  0682:01e7  cb               retf                                     
  0682:01e8  c8000000         enter 0, 0                               
  0682:01ec  1e               push ds                                  
  0682:01ed  06               push es                                  
  0682:01ee  57               push di                                  
  0682:01ef  56               push si                                  
  0682:01f0  50               push ax                                  
  0682:01f1  53               push bx                                  
  0682:01f2  51               push cx                                  
  0682:01f3  52               push dx                                  
  0682:01f4  fc               cld                                      
  0682:01f5  c57606           lds si, ptr [bp + 6]                     
  0682:01f8  c47e0a           les di, ptr [bp + 0xa]                   
  0682:01fb  8b560e           mov dx, word ptr [bp + 0xe]              
  0682:01fe  8b4e10           mov cx, word ptr [bp + 0x10]             
  0682:0201  c1e902           shr cx, 2                                
  0682:0204  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0682:0207  037612           add si, word ptr [bp + 0x12]             
  0682:020a  037e14           add di, word ptr [bp + 0x14]             
  0682:020d  4a               dec dx                                   
  0682:020e  75ee             jne 0x1fe                                
  0682:0210  5a               pop dx                                   
  0682:0211  59               pop cx                                   
  0682:0212  5b               pop bx                                   
  0682:0213  58               pop ax                                   
  0682:0214  5e               pop si                                   
  0682:0215  5f               pop di                                   
  0682:0216  07               pop es                                   
  0682:0217  1f               pop ds                                   
  0682:0218  c9               leave                                    
  0682:0219  cb               retf                                     
  0682:021a  c8000000         enter 0, 0                               
  0682:021e  1e               push ds                                  
  0682:021f  06               push es                                  
  0682:0220  57               push di                                  
  0682:0221  56               push si                                  
  0682:0222  50               push ax                                  
  0682:0223  53               push bx                                  
  0682:0224  51               push cx                                  
  0682:0225  52               push dx                                  
  0682:0226  fc               cld                                      
  0682:0227  c57606           lds si, ptr [bp + 6]                     
  0682:022a  c47e0a           les di, ptr [bp + 0xa]                   
  0682:022d  8b560e           mov dx, word ptr [bp + 0xe]              
  0682:0230  8b4e10           mov cx, word ptr [bp + 0x10]             
  0682:0233  d1e9             shr cx, 1                                
  0682:0235  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0682:0237  037612           add si, word ptr [bp + 0x12]             
  0682:023a  037e14           add di, word ptr [bp + 0x14]             
  0682:023d  4a               dec dx                                   
  0682:023e  75f0             jne 0x230                                
  0682:0240  5a               pop dx                                   
  0682:0241  59               pop cx                                   
  0682:0242  5b               pop bx                                   
  0682:0243  58               pop ax                                   
  0682:0244  5e               pop si                                   
  0682:0245  5f               pop di                                   
  0682:0246  07               pop es                                   
  0682:0247  1f               pop ds                                   
  0682:0248  c9               leave                                    
  0682:0249  cb               retf                                     
  0682:024a  c8000000         enter 0, 0                               
  0682:024e  1e               push ds                                  
  0682:024f  06               push es                                  
  0682:0250  57               push di                                  
  0682:0251  56               push si                                  
  0682:0252  50               push ax                                  
  0682:0253  53               push bx                                  
  0682:0254  51               push cx                                  
  0682:0255  52               push dx                                  
  0682:0256  fc               cld                                      
  0682:0257  c57606           lds si, ptr [bp + 6]                     
  0682:025a  c47e0a           les di, ptr [bp + 0xa]                   
  0682:025d  8b560e           mov dx, word ptr [bp + 0xe]              
  0682:0260  8b4e10           mov cx, word ptr [bp + 0x10]             
  0682:0263  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0682:0265  037612           add si, word ptr [bp + 0x12]             
  0682:0268  037e14           add di, word ptr [bp + 0x14]             
  0682:026b  4a               dec dx                                   
  0682:026c  75f2             jne 0x260                                
  0682:026e  5a               pop dx                                   
  0682:026f  59               pop cx                                   
