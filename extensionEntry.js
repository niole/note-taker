/**
 * Mounts application in content page
 */

const sidebar = document.createElement('div');
sidebar.setAttribute('class', 'note-taker-3-side-nav');
const app = document.createElement('div');
sidebar.append(app);
document.body.append(sidebar)
Elm.Main.init({
  node: app,
});
