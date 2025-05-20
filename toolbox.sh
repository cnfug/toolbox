#!/bin/bash

#====================#
# 万能工具箱主脚本   #
#====================#

set -e

COLOR_GREEN='\033[0;32m'
COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[1;33m'
COLOR_NONE='\033[0m'

main_menu() {
  echo -e "${COLOR_GREEN}====== 一键工具箱脚本 v1.0 ======${COLOR_NONE}"
  echo "1. DD重装系统"
  echo "2. 综合测试脚本"
  echo "3. 性能测试 (YABS)"
  echo "4. 流媒体/IP质量测试"
  echo "5. 网络测速脚本"
  echo "6. 回程测试"
  echo "7. 功能脚本（BBR、SWAP等）"
  echo "8. 常用软件一键安装"
  echo "9. 综合工具脚本（科技lion等）"
  echo "0. 退出"
  echo ""
  read -rp "请输入数字选择要执行的操作: " choice

  case $choice in
    1) dd_reinstall ;;
    2) test_suite ;;
    3) yabs_test ;;
    4) media_test ;;
    5) speed_test ;;
    6) trace_test ;;
    7) function_tools ;;
    8) software_install ;;
    9) mega_toolbox ;;
    0) exit 0 ;;
    *) echo -e "${COLOR_RED}请输入有效选项${COLOR_NONE}"; sleep 1; main_menu ;;
  esac
}

dd_reinstall() {
  echo "1) 史上最强脚本 (Debian12)"
  echo "2) 萌咖脚本 (Debian11)"
  echo "3) Beta.gs脚本"
  echo "4) DD安装Windows 10"
  read -rp "选择脚本编号: " dd_choice
  case $dd_choice in
    1) bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh') -debian 12 -pwd 'password' ;;
    2) bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh') -d 11 -v 64 -p password -port 22 -a -firmware ;;
    3) wget --no-check-certificate -O NewReinstall.sh https://raw.githubusercontent.com/fcurrk/reinstall/master/NewReinstall.sh && chmod +x NewReinstall.sh && bash NewReinstall.sh ;;
    4) bash <(curl -sSL https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh) -windows 10 -lang "cn" ;;
  esac
  back_to_menu
}

test_suite() {
  echo "1) bench.sh"
  echo "2) LemonBench"
  echo "3) NodeBench"
  echo "4) 融合怪"
  read -rp "选择编号: " t_choice
  case $t_choice in
    1) wget -qO- bench.sh | bash ;;
    2) wget -qO- https://raw.githubusercontent.com/LemonBench/LemonBench/main/LemonBench.sh | bash -s -- --fast ;;
    3) bash <(curl -sL https://raw.githubusercontent.com/LloydAsp/NodeBench/main/NodeBench.sh) ;;
    4) bash <(wget -qO- --no-check-certificate https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh) ;;
  esac
  back_to_menu
}

yabs_test() {
  echo "1) 全部测试"
  echo "2) 跳过网络，测GB5"
  echo "3) 跳过网络和磁盘"
  echo "4) 只测GB5"
  read -rp "选择: " y_choice
  case $y_choice in
    1) curl -sL yabs.sh | bash ;;
    2) curl -sL yabs.sh | bash -s -- -i5 ;;
    3) curl -sL yabs.sh | bash -s -- -if5 ;;
    4) curl -sL yabs.sh | bash -s -- -5 ;;
  esac
  back_to_menu
}

media_test() {
  echo "1) 通用解锁脚本"
  echo "2) Media.Check.Place"
  echo "3) 最准确检测"
  echo "4) IP质量体检"
  echo "5) DNS解锁"
  read -rp "选择编号: " m_choice
  case $m_choice in
    1) bash <(curl -L -s check.unlock.media) ;;
    2) bash <(curl -sL Media.Check.Place) ;;
    3) bash <(curl -L -s https://github.com/1-stream/RegionRestrictionCheck/raw/main/check.sh) ;;
    4) bash <(curl -sL IP.Check.Place) ;;
    5) wget https://raw.githubusercontent.com/Jimmyzxk/DNS-Alice-Unlock/refs/heads/main/dns-unlock.sh && bash dns-unlock.sh ;;
  esac
  back_to_menu
}

speed_test() {
  echo "1) bash.icu测速"
  echo "2) Taier测速"
  echo "3) hyperspeed"
  echo "4) 全球测速 network-speed.xyz"
  read -rp "选择编号: " s_choice
  case $s_choice in
    1) bash <(curl -sL bash.icu/speedtest) ;;
    2) bash <(curl -sL res.yserver.ink/taier.sh) ;;
    3) bash <(curl -Lso- https://bench.im/hyperspeed) ;;
    4) curl -sL network-speed.xyz | bash ;;
  esac
  back_to_menu
}

trace_test() {
  echo "1) 小白版回程"
  echo "2) 回程详细测试1"
  echo "3) 回程详细测试2"
  read -rp "选择编号: " r_choice
  case $r_choice in
    1) curl https://raw.githubusercontent.com/ludashi2020/backtrace/main/install.sh -sSf | sh ;;
    2) wget -N --no-check-certificate https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh && chmod +x AutoTrace.sh && bash AutoTrace.sh ;;
    3) wget https://ghproxy.com/https://raw.githubusercontent.com/vpsxb/testrace/main/testrace.sh -O testrace.sh && bash testrace.sh ;;
  esac
  back_to_menu
}

function_tools() {
  echo "1) 添加SWAP"
  echo "2) Fail2ban"
  echo "3) 一键BBR"
  echo "4) 多功能BBR脚本"
  echo "5) TCP调优"
  read -rp "选择编号: " f_choice
  case $f_choice in
    1) wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh ;;
    2) wget --no-check-certificate https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/fail2ban.sh && bash fail2ban.sh ;;
    3) echo -e "net.core.default_qdisc=fq\nnet.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf && sysctl -p ;;
    4) wget -N --no-check-certificate "https://gist.github.com/zeruns/a0ec603f20d1b86de6a774a8ba27588f/raw/4f9957ae23f5efb2bb7c57a198ae2cffebfb1c56/tcp.sh" && chmod +x tcp.sh && ./tcp.sh ;;
    5) wget http://sh.nekoneko.cloud/tools.sh -O tools.sh && bash tools.sh ;;
  esac
  back_to_menu
}

software_install() {
  echo "1) Docker"
  echo "2) Python"
  echo "3) iperf3"
  echo "4) 宝塔"
  echo "5) 哪吒监控"
  echo "6) Aria2"
  echo "7) 极光面板"
  read -rp "选择编号: " i_choice
  case $i_choice in
    1) curl -sSL https://get.daocloud.io/docker | sh ;;
    2) curl -O https://raw.githubusercontent.com/lx969788249/lxspacepy/master/pyinstall.sh && chmod +x pyinstall.sh && ./pyinstall.sh ;;
    3) apt install -y iperf3 ;;
    4) wget -O install.sh http://v7.hostcli.com/install/install-ubuntu_6.0.sh && sudo bash install.sh ;;
    5) curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh ;;
    6) wget -N git.io/aria2.sh && chmod +x aria2.sh && ./aria2.sh ;;
    7) bash <(curl -fsSL https://raw.githubusercontent.com/Aurora-Admin-Panel/deploy/main/install.sh) ;;
  esac
  back_to_menu
}

mega_toolbox() {
  echo "1) 科技lion工具箱"
  echo "2) SKY-BOX"
  read -rp "选择编号: " m_choice
  case $m_choice in
    1) apt update -y && apt install -y curl && bash <(curl -sL kejilion.sh) ;;
    2) wget -O box.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && ./box.sh ;;
  esac
  back_to_menu
}

back_to_menu() {
  echo -e "${COLOR_YELLOW}按任意键返回主菜单...${COLOR_NONE}"
  read -n 1 -s
  main_menu
}

main_menu
