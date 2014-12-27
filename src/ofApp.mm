#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    w = ofGetScreenWidth(); h = ofGetScreenHeight();
    ofSetWindowShape(w,h);
    ofSetDataPathRoot("../Resources/data/");
    transparent.afterMainSetup(ofxTransparentWindow::NORMAL);
    ofSetWindowPosition(0, 0);
    
    void * window = (NSWindow *) ofGetWindowPtr()->getCocoaWindow();
    [(NSWindow *) window setLevel:NSFloatingWindowLevel];
    [(NSWindow *) window setIgnoresMouseEvents:YES];
}

//--------------------------------------------------------------
void ofApp::update(){
    if(ofGetFrameNum() % 5 == 0) {
        addLayer();
    }
    ofSetWindowPosition(0, abs(sin(((float)shotNum)/50.0) * 100));
    transparent.update();
}

//--------------------------------------------------------------
void ofApp::addLayer() {
    char command[100];
    char rmcommand[100];
    string filename = "waterfall.jpg";
    std::sprintf(rmcommand, "rm ../Resources/data/%s", filename.c_str());
    std::sprintf(command, "screencapture ../Resources/data/%s", filename.c_str());
    if(lastImg.isAllocated()) std::system(rmcommand);
    std::system(command);
    lastImg.loadImage(filename);
    ofImage newLayer;
    while(!newLayer.loadImage(filename)) {
        continue;
    }
    shotNum++;
}

//--------------------------------------------------------------
void ofApp::draw(){
    transparent.update();
    lastImg.draw(0,0,w,h);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){
    
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){
    
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){
    
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){
    
}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){
    
}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){
    
}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){
    
}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){
    
}
