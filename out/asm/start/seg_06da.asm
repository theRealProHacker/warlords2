; seg 06da  img 0x6da0..0x6eb0  file off 0x79a0
  06da:0000  f9               stc                                      
  06da:0001  cb               retf                                     

proc_06da_0002:
  06da:0002  55               push bp                                  
  06da:0003  8bec             mov bp, sp                               
  06da:0005  06               push es                                  
  06da:0006  57               push di                                  
  06da:0007  8b4606           mov ax, word ptr [bp + 6]                
  06da:000a  8ec0             mov es, ax                               
  06da:000c  8b7e08           mov di, word ptr [bp + 8]                
  06da:000f  8b4e0c           mov cx, word ptr [bp + 0xc]              
  06da:0012  8b460a           mov ax, word ptr [bp + 0xa]              
  06da:0015  f3aa             rep stosb byte ptr es:[di], al           
  06da:0017  5f               pop di                                   
  06da:0018  07               pop es                                   
  06da:0019  5d               pop bp                                   
  06da:001a  cb               retf                                     

proc_06da_001b:
  06da:001b  55               push bp                                  
  06da:001c  8bec             mov bp, sp                               
  06da:001e  57               push di                                  
  06da:001f  32e4             xor ah, ah                               
  06da:0021  cd1a             int 0x1a                                 
  06da:0023  837e0600         cmp word ptr [bp + 6], 0                 
  06da:0027  740a             je 0x33                                  
  06da:0029  c47e06           les di, ptr [bp + 6]                     
  06da:002c  268915           mov word ptr es:[di], dx                 
  06da:002f  26895502         mov word ptr es:[di + 2], dx             
  06da:0033  8bc2             mov ax, dx                               
  06da:0035  8bd1             mov dx, cx                               
  06da:0037  5f               pop di                                   
  06da:0038  5d               pop bp                                   
  06da:0039  cb               retf                                     

proc_06da_003a:
  06da:003a  55               push bp                                  
  06da:003b  8bec             mov bp, sp                               
  06da:003d  b701             mov bh, 1                                
  06da:003f  8b4606           mov ax, word ptr [bp + 6]                
  06da:0042  8ad8             mov bl, al                               
  06da:0044  32c0             xor al, al                               
  06da:0046  b40b             mov ah, 0xb                              
  06da:0048  cd10             int 0x10                                 
  06da:004a  5d               pop bp                                   
  06da:004b  cb               retf                                     

proc_06da_004c:
  06da:004c  55               push bp                                  
  06da:004d  8bec             mov bp, sp                               
  06da:004f  8b4606           mov ax, word ptr [bp + 6]                
  06da:0052  8af8             mov bh, al                               
  06da:0054  32db             xor bl, bl                               
  06da:0056  b001             mov al, 1                                
  06da:0058  b410             mov ah, 0x10                             
  06da:005a  cd10             int 0x10                                 
  06da:005c  5d               pop bp                                   
  06da:005d  cb               retf                                     

proc_06da_005e:
  06da:005e  55               push bp                                  
  06da:005f  8bec             mov bp, sp                               
  06da:0061  32ff             xor bh, bh                               
  06da:0063  8b4606           mov ax, word ptr [bp + 6]                
  06da:0066  8ad8             mov bl, al                               
  06da:0068  32c0             xor al, al                               
  06da:006a  b40b             mov ah, 0xb                              
  06da:006c  cd10             int 0x10                                 
  06da:006e  5d               pop bp                                   
  06da:006f  cb               retf                                     
  06da:0070  b401             mov ah, 1                                
  06da:0072  cd16             int 0x16                                 
  06da:0074  7406             je 0x7c                                  
  06da:0076  32e4             xor ah, ah                               
  06da:0078  cd16             int 0x16                                 
  06da:007a  ebf4             jmp 0x70                                 
  06da:007c  cb               retf                                     
  06da:007d  cd11             int 0x11                                 
  06da:007f  b106             mov cl, 6                                
  06da:0081  d3e8             shr ax, cl                               
  06da:0083  250300           and ax, 3                                
  06da:0086  40               inc ax                                   
  06da:0087  cb               retf                                     
  06da:0088  b419             mov ah, 0x19                             
  06da:008a  cd21             int 0x21                                 
  06da:008c  32e4             xor ah, ah                               
  06da:008e  0461             add al, 0x61                             
  06da:0090  cb               retf                                     
  06da:0091  56               push si                                  
  06da:0092  f8               clc                                      
  06da:0093  a0af06           mov al, byte ptr [0x6af]                 
  06da:0096  1006ae06         adc byte ptr [0x6ae], al                 
  06da:009a  a0ae06           mov al, byte ptr [0x6ae]                 
  06da:009d  1006ad06         adc byte ptr [0x6ad], al                 
  06da:00a1  a0ad06           mov al, byte ptr [0x6ad]                 
  06da:00a4  1006ac06         adc byte ptr [0x6ac], al                 
  06da:00a8  be0300           mov si, 3                                
  06da:00ab  fe84ac06         inc byte ptr [si + 0x6ac]                
  06da:00af  7406             je 0xb7                                  
  06da:00b1  4e               dec si                                   
  06da:00b2  79f7             jns 0xab                                 
  06da:00b4  be0000           mov si, 0                                
  06da:00b7  8a84ac06         mov al, byte ptr [si + 0x6ac]            
  06da:00bb  2ae4             sub ah, ah                               
  06da:00bd  5e               pop si                                   
  06da:00be  cb               retf                                     
  06da:00bf  06               push es                                  
  06da:00c0  b800f0           mov ax, 0xf000                           
  06da:00c3  8ec0             mov es, ax                               
  06da:00c5  26a0feff         mov al, byte ptr es:[0xfffe]             
  06da:00c9  32e4             xor ah, ah                               
  06da:00cb  07               pop es                                   
  06da:00cc  cb               retf                                     
  06da:00cd  06               push es                                  
  06da:00ce  b800f0           mov ax, 0xf000                           
  06da:00d1  8ec0             mov es, ax                               
  06da:00d3  26a000c0         mov al, byte ptr es:[0xc000]             
  06da:00d7  32e4             xor ah, ah                               
  06da:00d9  07               pop es                                   
  06da:00da  cb               retf                                     
  06da:00db  c8000000         enter 0, 0                               
  06da:00df  9b               wait                                     
  06da:00e0  dbe3             fninit                                   
  06da:00e2  df460a           fild word ptr [bp + 0xa]                 
  06da:00e5  df4606           fild word ptr [bp + 6]                   
  06da:00e8  dee9             fsubp st(1)                              
  06da:00ea  d9e1             fabs                                     
  06da:00ec  df5606           fist word ptr [bp + 6]                   
  06da:00ef  df4606           fild word ptr [bp + 6]                   
  06da:00f2  dec9             fmulp st(1)                              
  06da:00f4  df460c           fild word ptr [bp + 0xc]                 
  06da:00f7  df4608           fild word ptr [bp + 8]                   
  06da:00fa  dee9             fsubp st(1)                              
  06da:00fc  d9e1             fabs                                     
  06da:00fe  df5608           fist word ptr [bp + 8]                   
  06da:0101  df4608           fild word ptr [bp + 8]                   
  06da:0104  dec9             fmulp st(1)                              
  06da:0106  dec1             faddp st(1)                              
  06da:0108  d9fa             fsqrt                                    
  06da:010a  df5606           fist word ptr [bp + 6]                   
  06da:010d  8b4606           mov ax, word ptr [bp + 6]                
