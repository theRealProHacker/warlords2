; res_0e8f file_off 0x108f0
  0008  0000             add byte ptr [bx + si], al               
  000a  0000             add byte ptr [bx + si], al               
  000c  0000             add byte ptr [bx + si], al               
  000e  0000             add byte ptr [bx + si], al               
  0010  0000             add byte ptr [bx + si], al               
  0012  0000             add byte ptr [bx + si], al               
  0014  0000             add byte ptr [bx + si], al               
  0016  0000             add byte ptr [bx + si], al               

res_0e8f_0018:  ; ENTRY
  0018  50               push ax                                  
  0019  b435             mov ah, 0x35                             
  001b  cd21             int 0x21                                 
  001d  891d             mov word ptr [di], bx                    
  001f  8c4502           mov word ptr [di + 2], es                
  0022  58               pop ax                                   
  0023  b425             mov ah, 0x25                             
  0025  cd21             int 0x21                                 
  0027  cb               retf                                     
  0028  06               push es                                  
  0029  50               push ax                                  
  002a  e460             in al, 0x60                              
  002c  247f             and al, 0x7f                             
  002e  3c2e             cmp al, 0x2e                             
  0030  7512             jne 0x44                                 
  0032  33c0             xor ax, ax                               
  0034  8ec0             mov es, ax                               
  0036  26a01704         mov al, byte ptr es:[0x417]              
  003a  a804             test al, 4                               
  003c  7406             je 0x44                                  
  003e  24fb             and al, 0xfb                             
  0040  26a21704         mov byte ptr es:[0x417], al              
  0044  58               pop ax                                   
  0045  07               pop es                                   
  0046  2eff2e0800       ljmp cs:[8]                              

res_0e8f_004b:  ; ENTRY
  004b  57               push di                                  
  004c  1e               push ds                                  
  004d  06               push es                                  
  004e  803e703300       cmp byte ptr [0x3370], 0                 
  0053  7517             jne 0x6c                                 
  0055  c606703301       mov byte ptr [0x3370], 1                 
  005a  0e               push cs                                  
  005b  1f               pop ds                                   
  005c  1e               push ds                                  
  005d  07               pop es                                   
  005e  b80900           mov ax, 9                                
  0061  bf0800           mov di, 8                                
  0064  ba2800           mov dx, 0x28                             
  0067  90               nop                                      
  0068  0e               push cs                                  
  0069  e8acff           call 0x18                                
  006c  07               pop es                                   
  006d  1f               pop ds                                   
  006e  5f               pop di                                   
  006f  cb               retf                                     

res_0e8f_0070:  ; ENTRY
  0070  57               push di                                  
  0071  1e               push ds                                  
  0072  06               push es                                  
  0073  803e703300       cmp byte ptr [0x3370], 0                 
  0078  7414             je 0x8e                                  
  007a  c606703300       mov byte ptr [0x3370], 0                 
  007f  2e8b160800       mov dx, word ptr cs:[8]                  
  0084  2e8e1e0a00       mov ds, word ptr cs:[0xa]                
  0089  b80925           mov ax, 0x2509                           
  008c  cd21             int 0x21                                 
  008e  07               pop es                                   
  008f  1f               pop ds                                   
  0090  5f               pop di                                   
  0091  cb               retf                                     
  0092  cf               iret                                     

res_0e8f_0093:  ; ENTRY
  0093  57               push di                                  
  0094  06               push es                                  
  0095  1e               push ds                                  
  0096  803e713300       cmp byte ptr [0x3371], 0                 
  009b  7525             jne 0xc2                                 
  009d  c606713301       mov byte ptr [0x3371], 1                 
  00a2  0e               push cs                                  
  00a3  1f               pop ds                                   
  00a4  1e               push ds                                  
  00a5  07               pop es                                   
  00a6  b82300           mov ax, 0x23                             
  00a9  bf0c00           mov di, 0xc                              
  00ac  ba9200           mov dx, 0x92                             
  00af  90               nop                                      
  00b0  0e               push cs                                  
  00b1  e864ff           call 0x18                                
  00b4  b81b00           mov ax, 0x1b                             
  00b7  bf1000           mov di, 0x10                             
  00ba  ba9200           mov dx, 0x92                             
  00bd  90               nop                                      
  00be  0e               push cs                                  
  00bf  e856ff           call 0x18                                
  00c2  1f               pop ds                                   
  00c3  07               pop es                                   
  00c4  5f               pop di                                   
  00c5  cb               retf                                     

res_0e8f_00c6:  ; ENTRY
  00c6  06               push es                                  
  00c7  1e               push ds                                  
  00c8  803e713300       cmp byte ptr [0x3371], 0                 
  00cd  7423             je 0xf2                                  
  00cf  c606713300       mov byte ptr [0x3371], 0                 
  00d4  2e8b160c00       mov dx, word ptr cs:[0xc]                
  00d9  2e8e1e0e00       mov ds, word ptr cs:[0xe]                
  00de  b82325           mov ax, 0x2523                           
  00e1  cd21             int 0x21                                 
  00e3  2e8b161000       mov dx, word ptr cs:[0x10]               
  00e8  2e8e1e1200       mov ds, word ptr cs:[0x12]               
  00ed  b81b25           mov ax, 0x251b                           
  00f0  cd21             int 0x21                                 
  00f2  1f               pop ds                                   
  00f3  07               pop es                                   
  00f4  cb               retf                                     
  00f5  32c0             xor al, al                               
  00f7  cf               iret                                     

res_0e8f_00f8:  ; ENTRY
  00f8  56               push si                                  
  00f9  57               push di                                  
  00fa  06               push es                                  
  00fb  1e               push ds                                  
  00fc  803e723300       cmp byte ptr [0x3372], 0                 
  0101  7516             jne 0x119                                
  0103  c606723301       mov byte ptr [0x3372], 1                 
  0108  0e               push cs                                  
  0109  1f               pop ds                                   
  010a  1e               push ds                                  
  010b  07               pop es                                   
  010c  b024             mov al, 0x24                             
  010e  bf1400           mov di, 0x14                             
  0111  baf500           mov dx, 0xf5                             
  0114  90               nop                                      
  0115  0e               push cs                                  
  0116  e8fffe           call 0x18                                
  0119  1f               pop ds                                   
  011a  07               pop es                                   
  011b  5f               pop di                                   
  011c  5e               pop si                                   
  011d  cb               retf                                     

res_0e8f_011e:  ; ENTRY
  011e  57               push di                                  
  011f  06               push es                                  
  0120  1e               push ds                                  
  0121  803e723300       cmp byte ptr [0x3372], 0                 
  0126  7414             je 0x13c                                 
  0128  c606723300       mov byte ptr [0x3372], 0                 
  012d  2e8b161400       mov dx, word ptr cs:[0x14]               
  0132  2e8e1e1600       mov ds, word ptr cs:[0x16]               
  0137  b82425           mov ax, 0x2524                           
  013a  cd21             int 0x21                                 
  013c  1f               pop ds                                   
  013d  07               pop es                                   
  013e  5f               pop di                                   
  013f  cb               retf                                     
  0140  06               push es                                  
