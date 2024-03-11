<template>
  <div :class="classObj" class="app-wrapper" :style="{'--current-color': theme}">
    <div v-if="device==='mobile'&&sidebar.opened" class="drawer-bg" @click="handleClickOutside"/>
    <sidebar v-if="!sidebar.hide" class="sidebar-container"/>
    <div :class="{hasTagsView:needTagsView,sidebarHide:sidebar.hide}" class="main-container">
      <div :class="{'fixed-header':fixedHeader}">
        <navbar/>
        <tags-view v-if="needTagsView"/>
      </div>
      <app-main/>
      <right-panel>
        <settings/>
      </right-panel>

      <!-- 右侧悬浮按钮 -->
      <div class="position:relative">
        <button @click="handleClick" class="floating-btn">
          <i class="el-icon-service"></i>
        </button>
        <div class="floating-num" id="allNoReadMsgCount" style="display:none">0</div>
      </div>
      <Chat :style="openChat?'':'display:none'"/>
    </div>
  </div>
</template>

<script>
import RightPanel from '@/components/RightPanel'
import { AppMain, Navbar, Settings, Sidebar, TagsView } from './components'
import ResizeMixin from './mixin/ResizeHandler'
import { mapState } from 'vuex'
import variables from '@/assets/styles/variables.scss'
import Chat from "@/components/Chat/index.vue";

export default {
  name: 'Layout',
  components: {
    AppMain,
    Navbar,
    RightPanel,
    Settings,
    Sidebar,
    TagsView,
    Chat
  },
  data() {
    return {
      // 是否显示弹出层
      openChat: false,
    }
  },
  mixins: [ResizeMixin],
  computed: {
    ...mapState({
      theme: state => state.settings.theme,
      sideTheme: state => state.settings.sideTheme,
      sidebar: state => state.app.sidebar,
      device: state => state.app.device,
      needTagsView: state => state.settings.tagsView,
      fixedHeader: state => state.settings.fixedHeader
    }),
    classObj() {
      return {
        hideSidebar: !this.sidebar.opened,
        openSidebar: this.sidebar.opened,
        withoutAnimation: this.sidebar.withoutAnimation,
        mobile: this.device === 'mobile'
      }
    },
    variables() {
      return variables;
    }
  },
  methods: {
    handleClickOutside() {
      this.$store.dispatch('app/closeSideBar', { withoutAnimation: false })
    },
    handleClick(){
      this.openChat = !this.openChat;
    }
  }
}
</script>

<style lang="scss" scoped>
@import "~@/assets/styles/mixin.scss";
@import "~@/assets/styles/variables.scss";

.app-wrapper {
  @include clearfix;
  position: relative;
  height: 100%;
  width: 100%;

  &.mobile.openSidebar {
    position: fixed;
    top: 0;
  }
}

.drawer-bg {
  background: #000;
  opacity: 0.3;
  width: 100%;
  top: 0;
  height: 100%;
  position: absolute;
  z-index: 999;
}

.fixed-header {
  position: fixed;
  top: 0;
  right: 0;
  z-index: 9;
  width: calc(100% - #{$base-sidebar-width});
  transition: width 0.28s;
}

.hideSidebar .fixed-header {
  width: calc(100% - 54px);
}

.sidebarHide .fixed-header {
  width: 100%;
}

.mobile .fixed-header {
  width: 100%;
}
/* App.vue 或者单独的 CSS 文件 */
.container {
  position: relative; /* 将容器设置为相对定位，以便于子元素进行绝对定位 */
}

.floating-btn {
  position: absolute; /* 将按钮设置为绝对定位 */
  bottom: 30px; /* 控制按钮与底部的间距 */
  right: 30px; /* 控制按钮与右侧的间距 */
  width: 50px; /* 调整按钮的尺寸 */
  height: 50px;
  background-color: #b0f0f8; /* 修改按钮的背景色 */
  border-radius: 50%; /* 将按钮变成圆形 */
  color: #0e0f0f; /* 修改按钮上显示的字体颜色 */
  font-size: 24px; /* 调整按钮上显示的字体大小 */
  cursor: pointer; /* 当鼠标移动到按钮上时，光标会变成手型指示点击操作 */
  z-index: 101;
}

.floating-num{
  color:white;
  font-size: 17px;
  background-color: red;
  width:23px;
  height:23px;
  line-height: 23px;
  position: absolute; /* 将按钮设置为绝对定位 */
  bottom: 65px; /* 控制按钮与底部的间距 */
  right: 30px; /* 控制按钮与右侧的间距 */
  text-align:center;
  -webkit-border-radius: 24px;
  border-radius: 24px;
  z-index: 102;
}
</style>
