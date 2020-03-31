export default {
  buyProducts(products, cb, errorCb) {
    setTimeout(() => {
      Math.random() > 0.5 || navigator.userAgent.indexOf("PhantomJS") > -1
        ? cb()
        : errorCb();
    }, 100);
  }
};
