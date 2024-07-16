<template>
  <div class="navbar">
    <hamburger id="hamburger-container" :is-active="sidebar.opened" class="hamburger-container" @toggleClick="toggleSideBar" />

    <breadcrumb id="breadcrumb-container" class="breadcrumb-container" v-if="!topNav"/>
    <top-nav id="topmenu-container" class="topmenu-container" v-if="topNav"/>

    <div class="right-menu">
      <el-tooltip content="会员余额" effect="dark" placement="bottom">
        <user-amount id="user-amount" class="right-menu-item hover-effect" />
      </el-tooltip>
      <el-tooltip content="客服" effect="dark" placement="bottom">
        <im-chat id="im-chat" class="right-menu-item hover-effect" />
      </el-tooltip>
      <el-tooltip content="在线人数" effect="dark" placement="bottom">
        <online-user id="online-user" class="right-menu-item hover-effect" />
      </el-tooltip>
      <el-tooltip content="下分" effect="dark" placement="bottom">
        <top-postal id="top-postal" class="right-menu-item hover-effect" :down-count="down_count"/>
      </el-tooltip>
      <el-tooltip content="上分" effect="dark" placement="bottom">
        <top-recharge id="top-recharge" class="right-menu-item hover-effect" :up-count="up_count"/>
      </el-tooltip>
<!--      <template v-if="device!=='mobile'">-->
<!--        <search id="header-search" class="right-menu-item" />-->
<!--        <el-tooltip content="源码地址" effect="dark" placement="bottom">-->
<!--          <ruo-yi-git id="ruoyi-git" class="right-menu-item hover-effect" />-->
<!--        </el-tooltip>-->

<!--        <el-tooltip content="文档地址" effect="dark" placement="bottom">-->
<!--          <ruo-yi-doc id="ruoyi-doc" class="right-menu-item hover-effect" />-->
<!--        </el-tooltip>-->

<!--        <screenfull id="screenfull" class="right-menu-item hover-effect" />-->

<!--        <el-tooltip content="布局大小" effect="dark" placement="bottom">-->
<!--          <size-select id="size-select" class="right-menu-item hover-effect" />-->
<!--        </el-tooltip>-->

<!--      </template>-->

      <el-dropdown class="avatar-container right-menu-item hover-effect" trigger="click">
        <div class="avatar-wrapper">
          <img :src="avatar" class="user-avatar">
          <i class="el-icon-caret-bottom" />
        </div>
        <el-dropdown-menu slot="dropdown">
          <router-link to="/user/profile">
            <el-dropdown-item>个人中心</el-dropdown-item>
          </router-link>
<!--          <el-dropdown-item @click.native="setting = true">-->
<!--            <span>布局设置</span>-->
<!--          </el-dropdown-item>-->
          <el-dropdown-item divided @click.native="logout">
            <span>退出登录</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <audio ref="sfAudioPlayer" src="@/assets/audio/sf.mp3" @ended="handleSfEnded" controls muted style="display:none"></audio>
      <audio ref="xfAudioPlayer" src="@/assets/audio/xf.mp3" @ended="handleXfEnded" controls muted style="display:none"></audio>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Breadcrumb from '@/components/Breadcrumb'
import TopNav from '@/components/TopNav'
import Hamburger from '@/components/Hamburger'
import Screenfull from '@/components/Screenfull'
import SizeSelect from '@/components/SizeSelect'
import Search from '@/components/HeaderSearch'
import RuoYiGit from '@/components/RuoYi/Git'
import RuoYiDoc from '@/components/RuoYi/Doc'
import TopPostal from '@/components/Postal'
import TopRecharge from '@/components/Recharge'
import OnlineUser from '@/components/OnlineUser'
import ImChat from '@/components/ImChat'
import UserAmount from '@/components/UserAmount'
import {noApproveUpAndDownCnt} from "@/api/system/userMoney";

export default {
  components: {
    Breadcrumb,
    TopNav,
    Hamburger,
    Screenfull,
    SizeSelect,
    Search,
    RuoYiGit,
    RuoYiDoc,
    TopPostal,
    TopRecharge,
    OnlineUser,
    ImChat,
    UserAmount
  },
  computed: {
    ...mapGetters([
      'sidebar',
      'avatar',
      'device'
    ]),
    setting: {
      get() {
        return this.$store.state.settings.showSettings
      },
      set(val) {
        this.$store.dispatch('settings/changeSetting', {
          key: 'showSettings',
          value: val
        })
      }
    },
    topNav: {
      get() {
        return this.$store.state.settings.topNav
      }
    }
  },
  data() {
    return {
      up_count:0,
      down_count:0,
      sfPlayCount: 0,
      isSfPlaying: false,
      xfPlayCount: 0,
      isXfPlaying: false,
    }
  },
  mounted() {
    this.getUpAndDownCnt();
    setInterval(this.getUpAndDownCnt, 15000); //每15s刷新列表
  },
  methods: {
    getUpAndDownCnt(){
      noApproveUpAndDownCnt().then(response => {
        this.up_count = response.upCount;
        this.down_count = response.downCount;
        console.log("noApproveUpAndDownCnt");
        if(this.up_count > 0){
          this.sfPlayCount = 0;
          this.playSfAudio();
        }else if(this.down_count >0){
          this.xfPlayCount = 0;
          this.playXfAudio();
        }
      });
    },
    playSfAudio() {
      this.isSfPlaying = true;
      const sfAudioPlayer = this.$refs.sfAudioPlayer;

      // 确保audio元素已准备好
      if (sfAudioPlayer.readyState >= 3) {
        sfAudioPlayer.play().then(() => {
          // 播放成功
        }).catch(error => {
          // 播放失败，可能是浏览器自动播放策略导致
          console.error('自动播放失败:', error);
          // 在这里可以处理播放失败的逻辑，比如提示用户
        });
      } else {
        // 如果audio还没准备好，则等待一段时间再尝试播放
        setTimeout(() => {
          this.playSfAudio();
        }, 100);
      }
    },
    handleSfEnded() {
      this.sfPlayCount++;
      if (this.sfPlayCount < 5) {
        // 如果还没有播放5次，则再次播放
        this.playSfAudio();
      } else {
        // 播放5次后，移除事件监听器
        this.isSfPlaying = false;
      }
    },
    handleXfEnded(){
      this.xfPlayCount++;
      if (this.xfPlayCount < 5) {
        // 如果还没有播放5次，则再次播放
        this.playXfAudio();
      } else {
        // 播放5次后，移除事件监听器
        this.isXfPlaying = false;
      }
    },
    playXfAudio() {
      this.isXfPlaying = true;
      const xfAudioPlayer = this.$refs.xfAudioPlayer;
      // 确保audio元素已准备好
      if (xfAudioPlayer.readyState >= 3) {
        xfAudioPlayer.play().then(() => {
          // 播放成功
        }).catch(error => {
          // 播放失败，可能是浏览器自动播放策略导致
          console.error('自动播放失败:', error);
          // 在这里可以处理播放失败的逻辑，比如提示用户
        });
      } else {
        // 如果audio还没准备好，则等待一段时间再尝试播放
        setTimeout(() => {
          this.playXfAudio();
        }, 100);
      }
    },
    toggleSideBar() {
      this.$store.dispatch('app/toggleSideBar')
    },
    async logout() {
      this.$confirm('确定注销并退出系统吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$store.dispatch('LogOut').then(() => {
          location.href = '/index';
        })
      }).catch(() => {});
    }
  }
}
</script>

<style lang="scss" scoped>
.navbar {
  height: 50px;
  overflow: hidden;
  position: relative;
  background: #fff;
  box-shadow: 0 1px 4px rgba(0,21,41,.08);

  .hamburger-container {
    line-height: 46px;
    height: 100%;
    float: left;
    cursor: pointer;
    transition: background .3s;
    -webkit-tap-highlight-color:transparent;

    &:hover {
      background: rgba(0, 0, 0, .025)
    }
  }

  .breadcrumb-container {
    float: left;
  }

  .topmenu-container {
    position: absolute;
    left: 50px;
  }

  .errLog-container {
    display: inline-block;
    vertical-align: top;
  }

  .right-menu {
    float: right;
    height: 100%;
    line-height: 50px;

    &:focus {
      outline: none;
    }

    .right-menu-item {
      display: inline-block;
      padding: 0 8px;
      height: 100%;
      font-size: 18px;
      color: #5a5e66;
      vertical-align: text-bottom;

      &.hover-effect {
        cursor: pointer;
        transition: background .3s;

        &:hover {
          background: rgba(0, 0, 0, .025)
        }
      }
    }

    .avatar-container {
      margin-right: 30px;

      .avatar-wrapper {
        margin-top: 5px;
        position: relative;

        .user-avatar {
          cursor: pointer;
          width: 40px;
          height: 40px;
          border-radius: 10px;
        }

        .el-icon-caret-bottom {
          cursor: pointer;
          position: absolute;
          right: -20px;
          top: 25px;
          font-size: 12px;
        }
      }
    }
  }
}
</style>
