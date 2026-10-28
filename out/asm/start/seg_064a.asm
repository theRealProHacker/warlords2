; seg 064a  img 0x64a0..0x6590  file off 0x70a0
  064a:0000  b801be           mov ax, 0xbe01                           
  064a:0003  01c4             add sp, ax                               
  064a:0005  01ca             add dx, cx                               
  064a:0007  01d0             add ax, dx                               
  064a:0009  01d6             add si, dx                               
  064a:000b  01cb             add bx, cx                               
  064a:000d  00558b           add byte ptr [di - 0x75], dl             
  064a:0010  ec               in al, dx                                
  064a:0011  1e               push ds                                  
  064a:0012  56               push si                                  
  064a:0013  57               push di                                  
  064a:0014  8b560a           mov dx, word ptr [bp + 0xa]              
  064a:0017  f6c208           test dl, 8                               
  064a:001a  7412             je 0x2e                                  
  064a:001c  b43c             mov ah, 0x3c                             
  064a:001e  33c9             xor cx, cx                               
  064a:0020  c55606           lds dx, ptr [bp + 6]                     
  064a:0023  cd21             int 0x21                                 
  064a:0025  7314             jae 0x3b                                 
  064a:0027  8b560a           mov dx, word ptr [bp + 0xa]              
  064a:002a  81e2f7ff         and dx, 0xfff7                           
  064a:002e  b8023d           mov ax, 0x3d02                           
  064a:0031  c55606           lds dx, ptr [bp + 6]                     
  064a:0034  cd21             int 0x21                                 
  064a:0036  7303             jae 0x3b                                 
  064a:0038  b8ffff           mov ax, 0xffff                           
  064a:003b  5f               pop di                                   
  064a:003c  5e               pop si                                   
  064a:003d  1f               pop ds                                   
  064a:003e  8be5             mov sp, bp                               
  064a:0040  5d               pop bp                                   
  064a:0041  cb               retf                                     

proc_064a_0042:
  064a:0042  55               push bp                                  
  064a:0043  8bec             mov bp, sp                               
  064a:0045  1e               push ds                                  
  064a:0046  56               push si                                  
  064a:0047  57               push di                                  
  064a:0048  8b5e06           mov bx, word ptr [bp + 6]                
  064a:004b  b43e             mov ah, 0x3e                             
  064a:004d  cd21             int 0x21                                 
  064a:004f  5f               pop di                                   
  064a:0050  5e               pop si                                   
  064a:0051  1f               pop ds                                   
  064a:0052  8be5             mov sp, bp                               
  064a:0054  5d               pop bp                                   
  064a:0055  cb               retf                                     

proc_064a_0056:
  064a:0056  55               push bp                                  
  064a:0057  8bec             mov bp, sp                               
  064a:0059  1e               push ds                                  
  064a:005a  56               push si                                  
  064a:005b  57               push di                                  
  064a:005c  b440             mov ah, 0x40                             
  064a:005e  8b5e06           mov bx, word ptr [bp + 6]                
  064a:0061  8b4e0c           mov cx, word ptr [bp + 0xc]              
  064a:0064  c55608           lds dx, ptr [bp + 8]                     
  064a:0067  cd21             int 0x21                                 
  064a:0069  7303             jae 0x6e                                 
  064a:006b  b8ffff           mov ax, 0xffff                           
  064a:006e  5f               pop di                                   
  064a:006f  5e               pop si                                   
  064a:0070  1f               pop ds                                   
  064a:0071  8be5             mov sp, bp                               
  064a:0073  5d               pop bp                                   
  064a:0074  cb               retf                                     

proc_064a_0075:
  064a:0075  55               push bp                                  
  064a:0076  8bec             mov bp, sp                               
  064a:0078  1e               push ds                                  
  064a:0079  56               push si                                  
  064a:007a  57               push di                                  
  064a:007b  b43f             mov ah, 0x3f                             
  064a:007d  8b5e06           mov bx, word ptr [bp + 6]                
  064a:0080  8b4e0c           mov cx, word ptr [bp + 0xc]              
  064a:0083  c55608           lds dx, ptr [bp + 8]                     
  064a:0086  cd21             int 0x21                                 
  064a:0088  7303             jae 0x8d                                 
  064a:008a  b8ffff           mov ax, 0xffff                           
  064a:008d  5f               pop di                                   
  064a:008e  5e               pop si                                   
  064a:008f  1f               pop ds                                   
  064a:0090  8be5             mov sp, bp                               
  064a:0092  5d               pop bp                                   
  064a:0093  cb               retf                                     

proc_064a_0094:
  064a:0094  55               push bp                                  
  064a:0095  8bec             mov bp, sp                               
  064a:0097  1e               push ds                                  
  064a:0098  56               push si                                  
  064a:0099  57               push di                                  
  064a:009a  b442             mov ah, 0x42                             
  064a:009c  8a460c           mov al, byte ptr [bp + 0xc]              
  064a:009f  8b5e06           mov bx, word ptr [bp + 6]                
  064a:00a2  8b5608           mov dx, word ptr [bp + 8]                
  064a:00a5  8b4e0a           mov cx, word ptr [bp + 0xa]              
  064a:00a8  cd21             int 0x21                                 
  064a:00aa  5f               pop di                                   
  064a:00ab  5e               pop si                                   
  064a:00ac  1f               pop ds                                   
  064a:00ad  8be5             mov sp, bp                               
  064a:00af  5d               pop bp                                   
  064a:00b0  cb               retf                                     

proc_064a_00b1:
  064a:00b1  55               push bp                                  
  064a:00b2  8bec             mov bp, sp                               
  064a:00b4  1e               push ds                                  
  064a:00b5  56               push si                                  
  064a:00b6  57               push di                                  
  064a:00b7  b80142           mov ax, 0x4201                           
  064a:00ba  8b5e06           mov bx, word ptr [bp + 6]                
  064a:00bd  33d2             xor dx, dx                               
  064a:00bf  33c9             xor cx, cx                               
  064a:00c1  cd21             int 0x21                                 
  064a:00c3  7227             jb 0xec                                  
  064a:00c5  52               push dx                                  
  064a:00c6  50               push ax                                  
  064a:00c7  b80242           mov ax, 0x4202                           
  064a:00ca  8b5e06           mov bx, word ptr [bp + 6]                
  064a:00cd  33c9             xor cx, cx                               
  064a:00cf  33d2             xor dx, dx                               
  064a:00d1  cd21             int 0x21                                 
  064a:00d3  8bf8             mov di, ax                               
  064a:00d5  8bf2             mov si, dx                               
  064a:00d7  5a               pop dx                                   
  064a:00d8  59               pop cx                                   
  064a:00d9  57               push di                                  
  064a:00da  56               push si                                  
  064a:00db  b80042           mov ax, 0x4200                           
  064a:00de  8b5e06           mov bx, word ptr [bp + 6]                
  064a:00e1  cd21             int 0x21                                 
  064a:00e3  5a               pop dx                                   
  064a:00e4  58               pop ax                                   
  064a:00e5  5f               pop di                                   
  064a:00e6  5e               pop si                                   
  064a:00e7  1f               pop ds                                   
  064a:00e8  8be5             mov sp, bp                               
  064a:00ea  5d               pop bp                                   
  064a:00eb  cb               retf                                     
  064a:00ec  33c0             xor ax, ax                               
  064a:00ee  8bd0             mov dx, ax                               
