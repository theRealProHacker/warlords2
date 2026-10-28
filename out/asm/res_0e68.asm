; res_0e68 file_off 0x10680

res_0e68_000a:  ; ENTRY
  000a  bada03           mov dx, 0x3da                            
  000d  ec               in al, dx                                
  000e  a808             test al, 8                               
  0010  74fb             je 0xd                                   
  0012  ec               in al, dx                                
  0013  a808             test al, 8                               
  0015  75fb             jne 0x12                                 
  0017  cb               retf                                     

res_0e68_0018:  ; ENTRY
  0018  55               push bp                                  
  0019  8bec             mov bp, sp                               
  001b  8b4e06           mov cx, word ptr [bp + 6]                
  001e  8ac1             mov al, cl                               
  0020  52               push dx                                  
  0021  bace03           mov dx, 0x3ce                            
  0024  8ae0             mov ah, al                               
  0026  b004             mov al, 4                                
  0028  ef               out dx, ax                               
  0029  5a               pop dx                                   
  002a  b001             mov al, 1                                
  002c  d2e0             shl al, cl                               
  002e  52               push dx                                  
  002f  bac403           mov dx, 0x3c4                            
  0032  8ae0             mov ah, al                               
  0034  b002             mov al, 2                                
  0036  ef               out dx, ax                               
  0037  5a               pop dx                                   
  0038  5d               pop bp                                   
  0039  cb               retf                                     

res_0e68_003a:  ; ENTRY
  003a  b00f             mov al, 0xf                              
  003c  52               push dx                                  
  003d  bac403           mov dx, 0x3c4                            
  0040  8ae0             mov ah, al                               
  0042  b002             mov al, 2                                
  0044  ef               out dx, ax                               
  0045  5a               pop dx                                   
  0046  cb               retf                                     

res_0e68_0047:  ; ENTRY
  0047  55               push bp                                  
  0048  8bec             mov bp, sp                               
  004a  8b4606           mov ax, word ptr [bp + 6]                
  004d  52               push dx                                  
  004e  bace03           mov dx, 0x3ce                            
  0051  8ae0             mov ah, al                               
  0053  b005             mov al, 5                                
  0055  ef               out dx, ax                               
  0056  5a               pop dx                                   
  0057  5d               pop bp                                   
  0058  cb               retf                                     

res_0e68_0059:  ; ENTRY
  0059  55               push bp                                  
  005a  8bec             mov bp, sp                               
  005c  83ec08           sub sp, 8                                
  005f  1e               push ds                                  
  0060  06               push es                                  
  0061  57               push di                                  
  0062  56               push si                                  
  0063  fc               cld                                      
  0064  8b460c           mov ax, word ptr [bp + 0xc]              
  0067  8ec0             mov es, ax                               
  0069  8b7608           mov si, word ptr [bp + 8]                
  006c  8b460a           mov ax, word ptr [bp + 0xa]              
  006f  2b4612           sub ax, word ptr [bp + 0x12]             
  0072  d1e0             shl ax, 1                                
  0074  8946fe           mov word ptr [bp - 2], ax                
  0077  8b461a           mov ax, word ptr [bp + 0x1a]             
  007a  2b4612           sub ax, word ptr [bp + 0x12]             
  007d  d1e0             shl ax, 1                                
  007f  8946fc           mov word ptr [bp - 4], ax                
  0082  8b4610           mov ax, word ptr [bp + 0x10]             
  0085  2d0100           sub ax, 1                                
  0088  d1e0             shl ax, 1                                
  008a  05d869           add ax, 0x69d8                           
  008d  8946f8           mov word ptr [bp - 8], ax                
  0090  8b5614           mov dx, word ptr [bp + 0x14]             
  0093  8b4e06           mov cx, word ptr [bp + 6]                
  0096  8ed9             mov ds, cx                               
  0098  8b5ef8           mov bx, word ptr [bp - 8]                
  009b  8b4e12           mov cx, word ptr [bp + 0x12]             
  009e  8b7e0e           mov di, word ptr [bp + 0xe]              
  00a1  8b5ef8           mov bx, word ptr [bp - 8]                
  00a4  83c302           add bx, 2                                
  00a7  895ef8           mov word ptr [bp - 8], bx                
  00aa  b82531           mov ax, 0x3125                           
  00ad  8ec0             mov es, ax                               
  00af  26033f           add di, word ptr es:[bx]                 
  00b2  8b4616           mov ax, word ptr [bp + 0x16]             
  00b5  8ec0             mov es, ax                               
  00b7  8b5e18           mov bx, word ptr [bp + 0x18]             
  00ba  268b1f           mov bx, word ptr es:[bx]                 
  00bd  8b460c           mov ax, word ptr [bp + 0xc]              
  00c0  8ec0             mov es, ax                               
  00c2  268b05           mov ax, word ptr es:[di]                 
  00c5  23c3             and ax, bx                               
  00c7  f7d3             not bx                                   
  00c9  231c             and bx, word ptr [si]                    
  00cb  0bc3             or ax, bx                                
  00cd  268905           mov word ptr es:[di], ax                 
  00d0  83461802         add word ptr [bp + 0x18], 2              
  00d4  83c702           add di, 2                                
  00d7  83c602           add si, 2                                
  00da  e2d6             loop 0xb2                                
  00dc  0376fe           add si, word ptr [bp - 2]                
  00df  8b4618           mov ax, word ptr [bp + 0x18]             
  00e2  0346fc           add ax, word ptr [bp - 4]                
  00e5  894618           mov word ptr [bp + 0x18], ax             
  00e8  4a               dec dx                                   
  00e9  75b0             jne 0x9b                                 
  00eb  5e               pop si                                   
  00ec  5f               pop di                                   
  00ed  07               pop es                                   
  00ee  1f               pop ds                                   
  00ef  8be5             mov sp, bp                               
  00f1  5d               pop bp                                   
  00f2  cb               retf                                     

res_0e68_00f3:  ; ENTRY
  00f3  55               push bp                                  
  00f4  8bec             mov bp, sp                               
  00f6  83ec06           sub sp, 6                                
  00f9  1e               push ds                                  
  00fa  06               push es                                  
  00fb  57               push di                                  
  00fc  56               push si                                  
  00fd  fc               cld                                      
  00fe  8b460a           mov ax, word ptr [bp + 0xa]              
  0101  2b4612           sub ax, word ptr [bp + 0x12]             
  0104  d1e0             shl ax, 1                                
  0106  8946fe           mov word ptr [bp - 2], ax                
  0109  8b4610           mov ax, word ptr [bp + 0x10]             
  010c  2b4612           sub ax, word ptr [bp + 0x12]             
  010f  d1e0             shl ax, 1                                
  0111  8946fc           mov word ptr [bp - 4], ax                
  0114  8b461a           mov ax, word ptr [bp + 0x1a]             
  0117  2b4612           sub ax, word ptr [bp + 0x12]             
  011a  d1e0             shl ax, 1                                
  011c  8946fa           mov word ptr [bp - 6], ax                
  011f  8b7608           mov si, word ptr [bp + 8]                
  0122  8b7e0e           mov di, word ptr [bp + 0xe]              
  0125  8b5614           mov dx, word ptr [bp + 0x14]             
  0128  8b4606           mov ax, word ptr [bp + 6]                
  012b  8ed8             mov ds, ax                               
  012d  8b4e12           mov cx, word ptr [bp + 0x12]             
  0130  8b4616           mov ax, word ptr [bp + 0x16]             
  0133  8ec0             mov es, ax                               
  0135  8b5e18           mov bx, word ptr [bp + 0x18]             
  0138  268b1f           mov bx, word ptr es:[bx]                 
  013b  8b460c           mov ax, word ptr [bp + 0xc]              
  013e  8ec0             mov es, ax                               
  0140  268b05           mov ax, word ptr es:[di]                 
  0143  23c3             and ax, bx                               
  0145  f7d3             not bx                                   
  0147  231c             and bx, word ptr [si]                    
  0149  0bc3             or ax, bx                                
  014b  268905           mov word ptr es:[di], ax                 
  014e  83461802         add word ptr [bp + 0x18], 2              
  0152  83c702           add di, 2                                
  0155  83c602           add si, 2                                
  0158  e2d6             loop 0x130                               
  015a  0376fe           add si, word ptr [bp - 2]                
  015d  037efc           add di, word ptr [bp - 4]                
  0160  8b4618           mov ax, word ptr [bp + 0x18]             
  0163  0346fa           add ax, word ptr [bp - 6]                
  0166  894618           mov word ptr [bp + 0x18], ax             
  0169  4a               dec dx                                   
  016a  75c1             jne 0x12d                                
  016c  5e               pop si                                   
  016d  5f               pop di                                   
  016e  07               pop es                                   
  016f  1f               pop ds                                   
  0170  8be5             mov sp, bp                               
  0172  5d               pop bp                                   
  0173  cb               retf                                     
  0174  55               push bp                                  
  0175  8bec             mov bp, sp                               
  0177  83ec06           sub sp, 6                                
  017a  1e               push ds                                  
  017b  06               push es                                  
  017c  57               push di                                  
  017d  56               push si                                  
  017e  fc               cld                                      
  017f  8b460a           mov ax, word ptr [bp + 0xa]              
  0182  2b4610           sub ax, word ptr [bp + 0x10]             
  0185  d1e0             shl ax, 1                                
  0187  8946fe           mov word ptr [bp - 2], ax                
  018a  8b460e           mov ax, word ptr [bp + 0xe]              
  018d  2b4610           sub ax, word ptr [bp + 0x10]             
  0190  d1e0             shl ax, 1                                
  0192  8946fc           mov word ptr [bp - 4], ax                
  0195  8b4616           mov ax, word ptr [bp + 0x16]             
  0198  2b4610           sub ax, word ptr [bp + 0x10]             
  019b  d1e0             shl ax, 1                                
  019d  8946fa           mov word ptr [bp - 6], ax                
  01a0  8b7608           mov si, word ptr [bp + 8]                
  01a3  8b7e0c           mov di, word ptr [bp + 0xc]              
  01a6  8b5612           mov dx, word ptr [bp + 0x12]             
  01a9  8b4606           mov ax, word ptr [bp + 6]                
  01ac  8ed8             mov ds, ax                               
  01ae  8b4e10           mov cx, word ptr [bp + 0x10]             
  01b1  8b5e14           mov bx, word ptr [bp + 0x14]             
  01b4  8b1f             mov bx, word ptr [bx]                    
  01b6  8b05             mov ax, word ptr [di]                    
  01b8  23c3             and ax, bx                               
  01ba  f7d3             not bx                                   
  01bc  231c             and bx, word ptr [si]                    
  01be  0bc3             or ax, bx                                
  01c0  8905             mov word ptr [di], ax                    
  01c2  83461402         add word ptr [bp + 0x14], 2              
  01c6  83c702           add di, 2                                
  01c9  83c602           add si, 2                                
  01cc  e2e3             loop 0x1b1                               
  01ce  0376fe           add si, word ptr [bp - 2]                
  01d1  037efc           add di, word ptr [bp - 4]                
  01d4  8b4614           mov ax, word ptr [bp + 0x14]             
  01d7  0346fa           add ax, word ptr [bp - 6]                
  01da  894614           mov word ptr [bp + 0x14], ax             
  01dd  4a               dec dx                                   
  01de  75ce             jne 0x1ae                                
  01e0  5e               pop si                                   
  01e1  5f               pop di                                   
  01e2  07               pop es                                   
  01e3  1f               pop ds                                   
  01e4  8be5             mov sp, bp                               
  01e6  5d               pop bp                                   
  01e7  cb               retf                                     
  01e8  c8000000         enter 0, 0                               
  01ec  1e               push ds                                  
  01ed  06               push es                                  
  01ee  57               push di                                  
  01ef  56               push si                                  
  01f0  50               push ax                                  
  01f1  53               push bx                                  
  01f2  51               push cx                                  
  01f3  52               push dx                                  
  01f4  fc               cld                                      
  01f5  c57606           lds si, ptr [bp + 6]                     
  01f8  c47e0a           les di, ptr [bp + 0xa]                   
  01fb  8b560e           mov dx, word ptr [bp + 0xe]              
  01fe  8b4e10           mov cx, word ptr [bp + 0x10]             
  0201  c1e902           shr cx, 2                                
  0204  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0207  037612           add si, word ptr [bp + 0x12]             
  020a  037e14           add di, word ptr [bp + 0x14]             
  020d  4a               dec dx                                   
  020e  75ee             jne 0x1fe                                
  0210  5a               pop dx                                   
  0211  59               pop cx                                   
  0212  5b               pop bx                                   
  0213  58               pop ax                                   
  0214  5e               pop si                                   
  0215  5f               pop di                                   
  0216  07               pop es                                   
  0217  1f               pop ds                                   
  0218  c9               leave                                    
  0219  cb               retf                                     
  021a  c8000000         enter 0, 0                               
  021e  1e               push ds                                  
  021f  06               push es                                  
  0220  57               push di                                  
  0221  56               push si                                  
  0222  50               push ax                                  
  0223  53               push bx                                  
  0224  51               push cx                                  
  0225  52               push dx                                  
  0226  fc               cld                                      
  0227  c57606           lds si, ptr [bp + 6]                     
  022a  c47e0a           les di, ptr [bp + 0xa]                   
  022d  8b560e           mov dx, word ptr [bp + 0xe]              
  0230  8b4e10           mov cx, word ptr [bp + 0x10]             
  0233  d1e9             shr cx, 1                                
  0235  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0237  037612           add si, word ptr [bp + 0x12]             
  023a  037e14           add di, word ptr [bp + 0x14]             
  023d  4a               dec dx                                   
  023e  75f0             jne 0x230                                
  0240  5a               pop dx                                   
  0241  59               pop cx                                   
  0242  5b               pop bx                                   
  0243  58               pop ax                                   
  0244  5e               pop si                                   
  0245  5f               pop di                                   
  0246  07               pop es                                   
  0247  1f               pop ds                                   
  0248  c9               leave                                    
  0249  cb               retf                                     
  024a  c8000000         enter 0, 0                               
  024e  1e               push ds                                  
  024f  06               push es                                  
  0250  57               push di                                  
  0251  56               push si                                  
  0252  50               push ax                                  
  0253  53               push bx                                  
  0254  51               push cx                                  
  0255  52               push dx                                  
  0256  fc               cld                                      
  0257  c57606           lds si, ptr [bp + 6]                     
  025a  c47e0a           les di, ptr [bp + 0xa]                   
  025d  8b560e           mov dx, word ptr [bp + 0xe]              
  0260  8b4e10           mov cx, word ptr [bp + 0x10]             
  0263  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0265  037612           add si, word ptr [bp + 0x12]             
  0268  037e14           add di, word ptr [bp + 0x14]             
  026b  4a               dec dx                                   
  026c  75f2             jne 0x260                                
  026e  5a               pop dx                                   
  026f  59               pop cx                                   
  0270  5b               pop bx                                   
  0271  58               pop ax                                   
  0272  5e               pop si                                   
  0273  5f               pop di                                   
  0274  07               pop es                                   
  0275  1f               pop ds                                   
  0276  c9               leave                                    
  0277  cb               retf                                     
  0278  00               db 00                                    
