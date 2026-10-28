; seg 06a9  img 0x6a90..0x6bd0  file off 0x7690
  06a9:0000  5b               pop bx                                   
  06a9:0001  58               pop ax                                   
  06a9:0002  5e               pop si                                   
  06a9:0003  5f               pop di                                   
  06a9:0004  07               pop es                                   
  06a9:0005  1f               pop ds                                   
  06a9:0006  c9               leave                                    
  06a9:0007  cb               retf                                     
  06a9:0008  0000             add byte ptr [bx + si], al               
  06a9:000a  0000             add byte ptr [bx + si], al               
  06a9:000c  0000             add byte ptr [bx + si], al               
  06a9:000e  0000             add byte ptr [bx + si], al               
  06a9:0010  0000             add byte ptr [bx + si], al               
  06a9:0012  0000             add byte ptr [bx + si], al               
  06a9:0014  0000             add byte ptr [bx + si], al               
  06a9:0016  0000             add byte ptr [bx + si], al               
  06a9:0018  50               push ax                                  
  06a9:0019  b435             mov ah, 0x35                             
  06a9:001b  cd21             int 0x21                                 
  06a9:001d  891d             mov word ptr [di], bx                    
  06a9:001f  8c4502           mov word ptr [di + 2], es                
  06a9:0022  58               pop ax                                   
  06a9:0023  b425             mov ah, 0x25                             
  06a9:0025  cd21             int 0x21                                 
  06a9:0027  cb               retf                                     
  06a9:0028  06               push es                                  
  06a9:0029  50               push ax                                  
  06a9:002a  e460             in al, 0x60                              
  06a9:002c  247f             and al, 0x7f                             
  06a9:002e  3c2e             cmp al, 0x2e                             
  06a9:0030  7512             jne 0x44                                 
  06a9:0032  33c0             xor ax, ax                               
  06a9:0034  8ec0             mov es, ax                               
  06a9:0036  26a01704         mov al, byte ptr es:[0x417]              
  06a9:003a  a804             test al, 4                               
  06a9:003c  7406             je 0x44                                  
  06a9:003e  24fb             and al, 0xfb                             
  06a9:0040  26a21704         mov byte ptr es:[0x417], al              
  06a9:0044  58               pop ax                                   
  06a9:0045  07               pop es                                   
  06a9:0046  2eff2e0800       ljmp cs:[8]                              
  06a9:004b  57               push di                                  
  06a9:004c  1e               push ds                                  
  06a9:004d  06               push es                                  
  06a9:004e  803e8e0600       cmp byte ptr [0x68e], 0                  
  06a9:0053  7517             jne 0x6c                                 
  06a9:0055  c6068e0601       mov byte ptr [0x68e], 1                  
  06a9:005a  0e               push cs                                  
  06a9:005b  1f               pop ds                                   
  06a9:005c  1e               push ds                                  
  06a9:005d  07               pop es                                   
  06a9:005e  b80900           mov ax, 9                                
  06a9:0061  bf0800           mov di, 8                                
  06a9:0064  ba2800           mov dx, 0x28                             
  06a9:0067  90               nop                                      
  06a9:0068  0e               push cs                                  
  06a9:0069  e8acff           call 0x18                                -> 06a9:0018
  06a9:006c  07               pop es                                   
  06a9:006d  1f               pop ds                                   
  06a9:006e  5f               pop di                                   
  06a9:006f  cb               retf                                     
  06a9:0070  57               push di                                  
  06a9:0071  1e               push ds                                  
  06a9:0072  06               push es                                  
  06a9:0073  803e8e0600       cmp byte ptr [0x68e], 0                  
  06a9:0078  7414             je 0x8e                                  
  06a9:007a  c6068e0600       mov byte ptr [0x68e], 0                  
  06a9:007f  2e8b160800       mov dx, word ptr cs:[8]                  
  06a9:0084  2e8e1e0a00       mov ds, word ptr cs:[0xa]                
  06a9:0089  b80925           mov ax, 0x2509                           
  06a9:008c  cd21             int 0x21                                 
  06a9:008e  07               pop es                                   
  06a9:008f  1f               pop ds                                   
  06a9:0090  5f               pop di                                   
  06a9:0091  cb               retf                                     
  06a9:0092  cf               iret                                     
  06a9:0093  57               push di                                  
  06a9:0094  06               push es                                  
  06a9:0095  1e               push ds                                  
  06a9:0096  803e8f0600       cmp byte ptr [0x68f], 0                  
  06a9:009b  7525             jne 0xc2                                 
  06a9:009d  c6068f0601       mov byte ptr [0x68f], 1                  
  06a9:00a2  0e               push cs                                  
  06a9:00a3  1f               pop ds                                   
  06a9:00a4  1e               push ds                                  
  06a9:00a5  07               pop es                                   
  06a9:00a6  b82300           mov ax, 0x23                             
  06a9:00a9  bf0c00           mov di, 0xc                              
  06a9:00ac  ba9200           mov dx, 0x92                             
  06a9:00af  90               nop                                      
  06a9:00b0  0e               push cs                                  
  06a9:00b1  e864ff           call 0x18                                -> 06a9:0018
  06a9:00b4  b81b00           mov ax, 0x1b                             
  06a9:00b7  bf1000           mov di, 0x10                             
  06a9:00ba  ba9200           mov dx, 0x92                             
  06a9:00bd  90               nop                                      
  06a9:00be  0e               push cs                                  
  06a9:00bf  e856ff           call 0x18                                -> 06a9:0018
  06a9:00c2  1f               pop ds                                   
  06a9:00c3  07               pop es                                   
  06a9:00c4  5f               pop di                                   
  06a9:00c5  cb               retf                                     
  06a9:00c6  06               push es                                  
  06a9:00c7  1e               push ds                                  
  06a9:00c8  803e8f0600       cmp byte ptr [0x68f], 0                  
  06a9:00cd  7423             je 0xf2                                  
  06a9:00cf  c6068f0600       mov byte ptr [0x68f], 0                  
  06a9:00d4  2e8b160c00       mov dx, word ptr cs:[0xc]                
  06a9:00d9  2e8e1e0e00       mov ds, word ptr cs:[0xe]                
  06a9:00de  b82325           mov ax, 0x2523                           
  06a9:00e1  cd21             int 0x21                                 
  06a9:00e3  2e8b161000       mov dx, word ptr cs:[0x10]               
  06a9:00e8  2e8e1e1200       mov ds, word ptr cs:[0x12]               
  06a9:00ed  b81b25           mov ax, 0x251b                           
  06a9:00f0  cd21             int 0x21                                 
  06a9:00f2  1f               pop ds                                   
  06a9:00f3  07               pop es                                   
  06a9:00f4  cb               retf                                     
  06a9:00f5  32c0             xor al, al                               
  06a9:00f7  cf               iret                                     
  06a9:00f8  56               push si                                  
  06a9:00f9  57               push di                                  
  06a9:00fa  06               push es                                  
  06a9:00fb  1e               push ds                                  
  06a9:00fc  803e900600       cmp byte ptr [0x690], 0                  
  06a9:0101  7516             jne 0x119                                
  06a9:0103  c606900601       mov byte ptr [0x690], 1                  
  06a9:0108  0e               push cs                                  
  06a9:0109  1f               pop ds                                   
  06a9:010a  1e               push ds                                  
  06a9:010b  07               pop es                                   
  06a9:010c  b024             mov al, 0x24                             
  06a9:010e  bf1400           mov di, 0x14                             
  06a9:0111  baf500           mov dx, 0xf5                             
  06a9:0114  90               nop                                      
  06a9:0115  0e               push cs                                  
  06a9:0116  e8fffe           call 0x18                                -> 06a9:0018
  06a9:0119  1f               pop ds                                   
  06a9:011a  07               pop es                                   
  06a9:011b  5f               pop di                                   
  06a9:011c  5e               pop si                                   
  06a9:011d  cb               retf                                     
  06a9:011e  57               push di                                  
  06a9:011f  06               push es                                  
  06a9:0120  1e               push ds                                  
  06a9:0121  803e900600       cmp byte ptr [0x690], 0                  
  06a9:0126  7414             je 0x13c                                 
  06a9:0128  c606900600       mov byte ptr [0x690], 0                  
  06a9:012d  2e8b161400       mov dx, word ptr cs:[0x14]               
  06a9:0132  2e8e1e1600       mov ds, word ptr cs:[0x16]               
  06a9:0137  b82425           mov ax, 0x2524                           
  06a9:013a  cd21             int 0x21                                 
  06a9:013c  1f               pop ds                                   
  06a9:013d  07               pop es                                   
  06a9:013e  5f               pop di                                   
  06a9:013f  cb               retf                                     
