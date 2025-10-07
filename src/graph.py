import json
import matplotlib.pyplot as plt

datas = ["144", "240", "360", "480", "720", "1080"]
vmafs = []
bitrates = []
for i in datas:
    try:
        with open(f"../output/vmaf_{i}p.json") as f:
            data = json.load(f)
        with open(f"../output/bitrate_{i}p.txt") as f:
            bitrates.append(int(f.readline())/1000)
            print(bitrates[-1])

        vmaf_values = [frame['metrics']['vmaf'] for frame in data['frames']]
        average_vmaf = sum(vmaf_values) / len(vmaf_values)
        vmafs.append(average_vmaf)
    except Exception as e:
        print(e)
        print('passed', i)

plt.plot(bitrates, vmafs)
plt.xlabel("Битрейт, кб/с")
plt.ylabel("Среднее значение VMAF, %")
plt.title("Зависимость VMAF от битрейта")
plt.savefig("../output/save.png")
