# Verilog设计实验

## 目录结构

```shell
.
├── 1
│   ├── bitstream
│   │   ├── comparator_4.bit
│   │   ├── decoder_38.bit
│   │   ├── priority_encoder_83.bit
│   │   └── seven_segment_decoder.bit
│   ├── img
│   │   ├── 3-8译码器测试.jpg
│   │   ├── 8-3优先编码器测试.jpg
│   │   ├── abcdefgh.png
│   │   ├── 七段译码器测试.jpg
│   │   └── 四位数据比较器测试.jpg
│   ├── project
│   │   ├── comparator_4
│   │   ├── decoder_38
│   │   ├── priority_encoder_83
│   │   └── seven_segment_decoder
│   ├── src
│   │   ├── comparator_4.v
│   │   ├── decoder_38.v
│   │   ├── priority_encoder_83.v
│   │   ├── seven_segment_decoder.v
│   │   ├── tb_comparator_4.v
│   │   ├── tb_decoder_38.v
│   │   ├── tb_priority_encoder_83.v
│   │   └── tb_seven_segment_decoder.v
│   ├── videos
│   │   ├── 3-8译码器测试.mp4
│   │   ├── 8-3优先编码器测试.mp4
│   │   ├── 七段译码器测试.mp4
│   │   └── 四位数据比较器测试.mp4
│   ├── wave
│   │   ├── 3-8译码器波形.png
│   │   ├── 8-3优先编码器波形.png
│   │   ├── comparator_4.wcfg
│   │   ├── decoder_38.wcfg
│   │   ├── priority_encoder_83.wcfg
│   │   ├── seven_segment_decoder.wcfg
│   │   ├── 七段译码器波形.png
│   │   └── 四位数据比较器波形.png
│   └── 实验报告一.md
├── 2
│   ├── bitstream
│   │   └── multifunction.bit
│   ├── img
│   │   └── 多功能数字电路测试.jpg
│   ├── project
│   │   └── multifunction
│   ├── src
│   │   ├── adder.v
│   │   ├── comparator.v
│   │   ├── mmax.v
│   │   ├── mmin.v
│   │   ├── multifunction.v
│   │   ├── select.v
│   │   ├── seven_segment_decoder.v
│   │   └── tb_multifunction.v
│   ├── videos
│   │   └── 多功能数字电路测试.mp4
│   ├── wave
│   │   ├── multifunction.wcfg
│   │   └── 多功能数字电路波形.png
│   └── 实验报告二.md
├── 3
│   ├── bitstream
│   │   ├── 216.bit
│   │   ├── 226.bit
│   │   └── 26.bit
│   ├── img
│   │   ├── 216.jpg
│   │   └── 26.jpg
│   ├── project
│   │   └── scan
│   ├── src
│   │   ├── scan_display.v
│   │   ├── scan_top.v
│   │   ├── seven_segment_decoder.v
│   │   ├── tb_scan_display.v
│   │   └── tb_scan_top.v
│   ├── wave
│   │   ├── scan.wcfg
│   │   └── 数码管扫描点亮电路波形.png
│   └── 实验报告三.md
├── README.md
└── attachment
    ├── FPGA.txt
    └── FPGA说明书.pdf

27 directories, 60 files
```

### 1. 组合逻辑基础模块

- 8-3优先编码器设计
- 3-8译码器设计
- 四位数据比较器设计
- 七段译码管

### 2. 复杂组合逻辑模块设计

- 求和
- 比较大小
- 输出最大值
- 输出最小值

### 3. 数码管扫描点亮电路

