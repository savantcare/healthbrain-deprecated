<template>
  <Split style="height: 100vh;">
    <SplitArea :size="70" :minSize="100">panel left</SplitArea>
    <SplitArea :size="30" :minSize="100">panel center</SplitArea>
  </Split>
</template>
<script>
export default {
  data() {
    return {};
  }
};
</script>