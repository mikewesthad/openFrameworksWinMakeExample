#include "testApp.h"


//--------------------------------------------------------------
void testApp::setup(){
    ofSetFrameRate(60);
    font.loadFont("arial", 100, true, true, true);
    generateMesh();

    // This will determine how far the vertices of the mesh are moved around
    maxDisplacement = 60.0f;
}

void testApp::generateMesh() {
    mesh.setMode(OF_PRIMITIVE_TRIANGLES);
    mesh.clear();
    vector<ofPath> paths = font.getStringAsPoints("fuck");
    for (int i=0; i<paths.size(); ++i) {
        mesh.append(paths[i].getTessellation());
    }
}

//--------------------------------------------------------------
void testApp::update(){
    // Reset the mesh back to its original text
    generateMesh();

    // Get the mouse location - it must be relative to the center of our screen because of ofTranslate()
    ofVec3f mouse(mouseX-ofGetWidth()/2.0f, mouseY-ofGetHeight()/2.0f, 0);

    // Loop through all the vertices in the mesh and move them away from the mouses
    for (int i=0; i<mesh.getNumVertices(); ++i) {

        // Get a vertex from the mesh
        ofVec3f vertex = mesh.getVertex(i);
        float distanceToMouse = mouse.distance(vertex);
        float displacement = ofMap(distanceToMouse, 0, 500, maxDisplacement, 0, true);
        ofVec3f direction = vertex - mouse;
        direction.normalize();
        ofVec3f displacedVertex = vertex + displacement*direction;
        mesh.setVertex(i, displacedVertex);
    }
}

//--------------------------------------------------------------
void testApp::draw(){
    ofBackground(0);

    ofPushMatrix();
        ofTranslate(ofGetWidth()/2.0f, ofGetHeight()/2.0);
        ofSetColor(255,0,127);
        mesh.draw();
    ofPopMatrix();
}

//--------------------------------------------------------------
void testApp::keyPressed(int key){

}

//--------------------------------------------------------------
void testApp::keyReleased(int key){

}

//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void testApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void testApp::dragEvent(ofDragInfo dragInfo){

}
