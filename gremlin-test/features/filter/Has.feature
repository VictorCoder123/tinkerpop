# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

Feature: Step - has()

  Scenario: Use has() with P.gt()
    Given the modern graph
    And the traversal of
      """
      g.V().has("age", P.gt(30))
      """
    When iterated to list
    Then the result should be unordered
      | result |
      | v[josh] |
      | v[peter] |

  Scenario: Use hasId() with P
    Given the modern graph
    And using the parameter v1 defined as "v[marko].id"
    And the traversal of
    """
    g.V().in().hasId(P.neq(v1))
    """
    When iterated to list
    Then the result should be unordered
      | result |
      | v[josh] |
      | v[josh] |
      | v[peter] |

  Scenario: g_V_hasXage_withinX27X_count
    Given the modern graph
    And the traversal of
      """
      g.V().has("age", P.within(27)).count()
      """
    When iterated to list
    Then the result should be ordered
      | result |
      | d[1].l |

  Scenario: g_V_hasXage_withinX27_29X_count
    Given the modern graph
    And the traversal of
      """
      g.V().has("age", P.within(27,29)).count()
      """
    When iterated to list
    Then the result should be ordered
      | result |
      | d[2].l |

  Scenario: g_V_hasXage_withoutX27X_count
    Given the modern graph
    And the traversal of
      """
      g.V().has("age", P.without(27)).count()
      """
    When iterated to list
    Then the result should be ordered
      | result |
      | d[3].l |

  Scenario: g_V_hasXage_withoutX27_29X_count
    Given the modern graph
    And the traversal of
      """
      g.V().has("age", P.without(27,29)).count()
      """
    When iterated to list
    Then the result should be ordered
      | result |
      | d[2].l |
