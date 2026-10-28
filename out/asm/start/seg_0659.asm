; seg 0659  img 0x6590..0x6660  file off 0x7190
  0659:0000  ebf3             jmp 0xfffffff5                           
  0659:0002  3b7610           cmp si, word ptr [bp + 0x10]             
  0659:0005  7d01             jge 8                                    
  0659:0007  c3               ret                                      
  0659:0008  06               push es                                  
  0659:0009  57               push di                                  
  0659:000a  56               push si                                  
  0659:000b  c47e0c           les di, ptr [bp + 0xc]                   
  0659:000e  c57610           lds si, ptr [bp + 0x10]                  
  0659:0011  8b4e14           mov cx, word ptr [bp + 0x14]             
  0659:0014  f7c10300         test cx, 3                               
  0659:0018  740f             je 0x29                                  
  0659:001a  90               nop                                      
  0659:001b  90               nop                                      
  0659:001c  f7c10100         test cx, 1                               
  0659:0020  7410             je 0x32                                  
  0659:0022  90               nop                                      
  0659:0023  90               nop                                      
  0659:0024  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0659:0026  eb0e             jmp 0x36                                 
  0659:0028  90               nop                                      
  0659:0029  c1c902           ror cx, 2                                
  0659:002c  f366a5           rep movsd dword ptr es:[di], dword ptr [si] 
  0659:002f  eb05             jmp 0x36                                 
  0659:0031  90               nop                                      
  0659:0032  d1c9             ror cx, 1                                
  0659:0034  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0659:0036  52               push dx                                  
  0659:0037  51               push cx                                  
  0659:0038  b43f             mov ah, 0x3f                             
  0659:003a  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0659:003d  c55610           lds dx, ptr [bp + 0x10]                  
  0659:0040  8b4e14           mov cx, word ptr [bp + 0x14]             
  0659:0043  cd21             int 0x21                                 
  0659:0045  59               pop cx                                   
  0659:0046  5a               pop dx                                   
  0659:0047  5e               pop si                                   
  0659:0048  2b7610           sub si, word ptr [bp + 0x10]             
  0659:004b  03760c           add si, word ptr [bp + 0xc]              
  0659:004e  5f               pop di                                   
  0659:004f  07               pop es                                   
  0659:0050  c3               ret                                      

proc_0659_0051:
  0659:0051  55               push bp                                  
  0659:0052  8bec             mov bp, sp                               
  0659:0054  1e               push ds                                  
  0659:0055  56               push si                                  
  0659:0056  57               push di                                  
  0659:0057  b43f             mov ah, 0x3f                             
  0659:0059  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0659:005c  c5560c           lds dx, ptr [bp + 0xc]                   
  0659:005f  8b4e14           mov cx, word ptr [bp + 0x14]             
  0659:0062  d1e1             shl cx, 1                                
  0659:0064  cd21             int 0x21                                 
  0659:0066  c47e06           les di, ptr [bp + 6]                     
  0659:0069  c5760c           lds si, ptr [bp + 0xc]                   
  0659:006c  8b5616           mov dx, word ptr [bp + 0x16]             
  0659:006f  32ed             xor ch, ch                               
  0659:0071  83fa00           cmp dx, 0                                
  0659:0074  7528             jne 0x9e                                 
  0659:0076  8b5618           mov dx, word ptr [bp + 0x18]             
  0659:0079  4a               dec dx                                   
  0659:007a  895618           mov word ptr [bp + 0x18], dx             
  0659:007d  83fa00           cmp dx, 0                                
  0659:0080  7448             je 0xca                                  
  0659:0082  8b5626           mov dx, word ptr [bp + 0x26]             
  0659:0085  42               inc dx                                   
  0659:0086  895626           mov word ptr [bp + 0x26], dx             
  0659:0089  c47e1a           les di, ptr [bp + 0x1a]                  
  0659:008c  83fa01           cmp dx, 1                                
  0659:008f  74db             je 0x6c                                  
  0659:0091  c47e1e           les di, ptr [bp + 0x1e]                  
  0659:0094  83fa02           cmp dx, 2                                
  0659:0097  74d3             je 0x6c                                  
  0659:0099  c47e22           les di, ptr [bp + 0x22]                  
  0659:009c  ebce             jmp 0x6c                                 
  0659:009e  ac               lodsb al, byte ptr [si]                  
  0659:009f  a880             test al, 0x80                            
  0659:00a1  741a             je 0xbd                                  
  0659:00a3  8ae0             mov ah, al                               
  0659:00a5  ac               lodsb al, byte ptr [si]                  
  0659:00a6  8a0c             mov cl, byte ptr [si]                    
  0659:00a8  41               inc cx                                   
  0659:00a9  46               inc si                                   
  0659:00aa  2bd1             sub dx, cx                               
  0659:00ac  8bde             mov bx, si                               
  0659:00ae  8bf7             mov si, di                               
  0659:00b0  03f0             add si, ax                               
  0659:00b2  26a4             movsb byte ptr es:[di], byte ptr es:[si] 
  0659:00b4  e2fc             loop 0xb2                                
  0659:00b6  8bf3             mov si, bx                               
  0659:00b8  e847ff           call 2                                   -> 0659:0002
  0659:00bb  ebb2             jmp 0x6f                                 
  0659:00bd  8ac8             mov cl, al                               
  0659:00bf  fec1             inc cl                                   
  0659:00c1  2bd1             sub dx, cx                               
  0659:00c3  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0659:00c5  e83aff           call 2                                   -> 0659:0002
  0659:00c8  eba5             jmp 0x6f                                 
  0659:00ca  5f               pop di                                   
  0659:00cb  5e               pop si                                   
  0659:00cc  1f               pop ds                                   
  0659:00cd  8be5             mov sp, bp                               
  0659:00cf  5d               pop bp                                   
