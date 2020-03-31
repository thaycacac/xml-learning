export function currency (data) {
  return data.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") + 'đ';
}
