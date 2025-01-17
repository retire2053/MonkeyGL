// MIT License

// Copyright (c) 2022 jiwenchen(cjwbeyond@hotmail.com)

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#pragma once
#include "Direction.h"
#include "Point.h"
#include <vector>
#include "Defines.h"

namespace MonkeyGL{
    
    class MarchingCube
    {
    private:
        /* data */
    public:
        MarchingCube(/* args */);
        ~MarchingCube();

    public:
        void LoadBinarySTL(const char* szFile);
        void LoadHumanMesh();

        std::vector<Facet2D> GetMeshPoints();
        std::vector<Facet3D> GetMesh(){
            return m_facet3Ds;
        }
        
    private:
        char m_table[256][16];
        std::vector<Facet3D> m_facet3Ds;

        std::string m_b64_human;
    };
}